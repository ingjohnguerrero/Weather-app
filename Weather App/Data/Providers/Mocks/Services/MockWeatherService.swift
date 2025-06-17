//
//  MockWeatherServiceTests.swift
//  Weather App
//
//  Created by John Guerrero on 6/17/25.
//

enum MockError: Error {
    case MockedError
}

class MockWeatherService: WeatherService {
    let returnsError: Bool

    init(returnsError: Bool = false) {
        self.returnsError = returnsError
    }

    func fetchForecast(forLat lat: Double, lon: Double) async throws -> Forecast {
        if returnsError {
            throw MockError.MockedError
        }
        let forecast = try JSONLoader.loadMock(.forecastByLatLngMock, as: OpenWeatherForecastDTO.self)
        return OpenWeatherForecastMapper().map(forecast)
    }
}

