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
