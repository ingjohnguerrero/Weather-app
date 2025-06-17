//
//  OWMWeatherService.swift
//  Weather App
//
//  Created by John Guerrero on 6/17/25.
//

class OWMWeatherService: WeatherService {
    private let apiKey: String

    init(apiKey: String) {
        self.apiKey = apiKey
    }

    func fetchForecast(forLat lat: Double, lon: Double) async throws -> Forecast {
        return Forecast(
            name: "",
            temp: 0.0,
            feels_like: 0.0,
            temp_min: 0.0,
            temp_max: 0.0,
            pressure: 0.0,
            humidity: 0.0,
            sea_level: 0.0,
            grnd_level: 0.0,
            weather: []
        )
    }
}
