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

    init(service: WeatherService = OWMWeatherService()) {
        self.service = service
    }

    func loadForecast(lat: Float, lon: Float) async {
        state = .loading
        do {
            let forecast = try await service.fetchForecast(
                forLat: lat,
                lon: lon
            )
            state = .success(forecast)
        } catch let error {
            state = .error(error.localizedDescription)
        }
    }
}
