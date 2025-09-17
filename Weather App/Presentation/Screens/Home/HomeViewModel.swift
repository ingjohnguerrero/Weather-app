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

@Observable
class HomeViewModel {
    private(set) var state: HomeState = .idle
    @ObservationIgnored private let service: CitiesService!

    init(service: CitiesService = OWMCitiesService()) {
        self.service = service
    }

    func reset() {
        state = .idle
    }

    func lookForCities(query: String) async {
        if query.isEmpty || query.count <= 3 {
            reset()
            return
        }
        state = .loading
        do {
            let cities = try await service.fetchCities(forName: query)
            state = .loaded(cities)
        } catch let error {
            state = .error(error.localizedDescription)
        }
    }
}
