//
//  ForecastDetailsViewModel.swift
//  Weather App
//
//  Created by John Guerrero on 6/15/25.
//

import Foundation

enum ForecastDetailsState: Equatable{
    case idle
    case loading
    case success(Forecast)
    case error(String)

    static func == (lhs: ForecastDetailsState, rhs: ForecastDetailsState) -> Bool {
        switch (lhs, rhs) {
            case (.idle, .idle), (.loading, .loading):
                return true
            case (.success(let lhsForecast), .success(let rhsForecast)):
                return lhsForecast.name == rhsForecast.name
            case (.error(let lhsError), .error(let rhsError)):
                return lhsError == rhsError
            default:
                return false

        }
    }
}

@Observable
class ForecastDetailsViewModel {
    private(set) var state: ForecastDetailsState = .idle
    @ObservationIgnored private let service: WeatherService!
    @ObservationIgnored private let dataStore: CitiesDataStore!

    init(
        service: WeatherService = OWMWeatherService(),
        dataStore: CitiesDataStore = try! SwiftDataCitiesDataStore()
    ) {
        self.service = service
        self.dataStore = dataStore
    }

    func loadForecast(_ city: City) async {
        state = .loading
        do {
            let forecast = try await service.fetchForecast(
                forLat: city.lat,
                lon: city.lon
            )
            state = .success(forecast)
        } catch let error {
            state = .error(error.localizedDescription)
        }
    }

    func addCityToRecent(_ city: City) async {
        do {
            try await dataStore.save(city: city)
        } catch {
            state = .error("Failed to save city: \(error.localizedDescription)")
        }
    }
}
