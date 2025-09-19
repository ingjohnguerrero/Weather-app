//
//  HomeViewModel.swift
//  Weather App
//
//  Created by John Guerrero on 9/16/25.
//

import Foundation

enum HomeState: Equatable{
    case idle
    case loading
    case loaded([City])
    case error(String)

    static func == (lhs: HomeState, rhs: HomeState) -> Bool {
        switch (lhs, rhs) {
            case (.idle, .idle): return true
            case (.loading, .loading): return true
            case (
                .loaded(let lCities),
                .loaded(let rCities)
            ): return lCities.count == rCities.count
            case (.error, .error): return true
            default: return false
        }
    }
}

@MainActor
@Observable
class HomeViewModel {
    private(set) var state: HomeState = .idle
    @ObservationIgnored private let repository: CitiesRepository!
    private var searchTimer: Timer?

    init(
        service: CitiesService = OWMCitiesService(),
        dataStore: CitiesDataStore = try! SwiftDataCitiesDataStore()
    ) {
        self.repository = CitiesRepository(
            service: service,
            dataStore: dataStore
        )
    }

    func reset() {
        state = .idle
    }

    func onStart() async {
        do {
            let cities = try await repository.recentCities()
            if cities.isEmpty {
                reset()
                return
            }
            state = .loaded(cities)
        } catch {
            reset()
        }
    }

    func lookForCities(query: String) async {
        searchTimer?.invalidate()
        guard !query.isEmpty, query.count > 3 else {
            await onStart()
            return
        }
        state = .loading
        // Timer closure must be synchronous and @Sendable. We avoid touching self
        // directly and hop to the main actor before using self.
        searchTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { [weak self] _ in
            Task { @MainActor [weak self] in
                guard let self else { return }
                await self.performSearch(query: query)
            }
        }
    }

    private func performSearch(query: String) async {
        do {
            let cities = try await repository.fetchCities(forName: query)
            state = .loaded(cities)
        } catch {
            state = .error(error.localizedDescription)
        }
    }
}
