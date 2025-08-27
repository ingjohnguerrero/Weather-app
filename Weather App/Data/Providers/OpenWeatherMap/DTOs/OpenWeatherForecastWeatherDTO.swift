//
//  OpenWeatherForecastWeatherDTO.swift
//  Weather App
//
//  Created by John Guerrero on 6/15/25.
//


struct OpenWeatherForecastWeatherDTO: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
