//
//  OWMCitiesService.swift
//  Weather App
//
//  Created by John Guerrero on 9/16/25.
//
import Foundation

enum OWMCitiesError: Error, CustomStringConvertible {
    case unableToConnect(description: String)
    var description: String {
        switch self {
            case .unableToConnect(description: let description):
                return description
        }
    }
}

class OWMCitiesService: CitiesService {
    private var apiKey: String = {
        guard let key = Bundle.main.object(forInfoDictionaryKey: "OpenWeatherMapsAppKey") as? String else {
            fatalError("OpenWeatherMapsAppKey not found in target properties")
        }
        return key
    }()
    private let baseURL: String = "https://api.openweathermap.org"

    init() {}

    func fetchCities(forName name: String) async throws -> [City] {
        let url = URL(string: "\(baseURL)/geo/1.0/direct?q=\(name)&limit=10&appid=\(apiKey)")!
        let (data, response) = try await URLSession.shared.data(
            from: url,
            delegate: nil
        )
        guard let httpUrlResponse = response as? HTTPURLResponse else {
            throw OWMCitiesError
            .unableToConnect(description: "Unable to connect to server")}
        if httpUrlResponse.statusCode != 200 {
            throw OWMCitiesError.unableToConnect(description: "Unable to connect to server: \(httpUrlResponse.statusCode)")
        }
        let citiesDTO = try JSONDecoder().decode(
            [OpenWeatherCityGeoCodingDTO].self,
            from: data
        )
        return citiesDTO.map{ $0.mapToCity() }
    }
}
