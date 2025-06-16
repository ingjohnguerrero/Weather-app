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

    func loadForecast() async {
        state = .loading
        do {
            let forecast = try JSONLoader.loadMock(.forecastByLatLngMock, as: OpenWeatherForecastDTO.self)
            state = .success(OpenWeatherForecastMapper().map(forecast))
        } catch let error {
            state = .error(error.localizedDescription)
        }
    }
}
