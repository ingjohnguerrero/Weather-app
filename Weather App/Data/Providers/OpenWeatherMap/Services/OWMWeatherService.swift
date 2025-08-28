//
//  OWMWeatherService.swift
//  Weather App
//
//  Created by John Guerrero on 6/17/25.
//

import Foundation

enum OWMWeatherServiceError: Error, CustomStringConvertible {
    case unableToConnect(description: String)
    var description: String {
        switch self {
            case .unableToConnect(description: let description):
                return description
        }
    }
}

class OWMWeatherService: WeatherService {
    private var apiKey: String = {
        guard let key = Bundle.main.object(forInfoDictionaryKey: "OpenWeatherMapsAppKey") as? String else {
            fatalError("OpenWeatherMapsAppKey not found in target properties")
        }
        return key
    }()
    private let baseURL: String = "https://api.openweathermap.org/data/2.5"
    private let mapper: OpenWeatherForecastMapper = OpenWeatherForecastMapper()


    init() {}

    func fetchForecast(forLat lat: Double, lon: Double) async throws -> Forecast {
        let url = URL(string: "\(baseURL)/weather?lat=\(lat)&lon=\(lon)&appid=\(apiKey)&units=metric")!
        let (data, response) = try await URLSession.shared.data(
            from: url,
            delegate: nil
        )

        guard let httpUrlResponse = response as? HTTPURLResponse else { throw OWMWeatherServiceError.unableToConnect(description: "Unable to connect to server") }
        if httpUrlResponse.statusCode != 200 {
            throw OWMWeatherServiceError.unableToConnect(description: "Unable to connect to server: \(httpUrlResponse.statusCode)")
        }
        let forecastDTO = try JSONDecoder().decode(OpenWeatherForecastDTO.self, from: data)
        return mapper.map(forecastDTO)
    }
}
