//
//  OpenWeatherCityGeoCodingDTO.swift
//  Weather App
//
//  Created by John Guerrero on 9/16/25.
//

struct OpenWeatherCityGeoCodingDTO: Codable {
    let name: String
    let lat: Float
    let lon: Float
    let country: String
    let state: String?
}

extension OpenWeatherCityGeoCodingDTO: CityMapper {
    func mapToCity() -> City {
        return City(
            name: self.name,
            lat: self.lat,
            lon: self.lon,
            country: self.country,
            state: self.state
        )
    }
}
