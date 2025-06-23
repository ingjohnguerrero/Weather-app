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

@MainActor
class ForecastDetailsViewModel: ObservableObject {
    @Published private(set) var state: ForecastDetailsState = .idle
    private let service: WeatherService!

    init(service: WeatherService = OWMWeatherService()) {
        self.service = service
    }

    func loadForecast() async {
        state = .loading
        do {
            let forecast = try await service.fetchForecast(
                forLat: 37.7749,
                lon: -122.4194
            )
            state = .success(forecast)
        } catch let error {
            state = .error(error.localizedDescription)
        }
    }
}
