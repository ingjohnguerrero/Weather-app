//
//  OpenWeatherForecastDTO.swift
//  Weather App
//
//  Created by John Guerrero on 6/15/25.
//

struct OpenWeatherForecastDTO: Decodable {
    let name: String
    let weather: [OpenWeatherForecastWeatherDTO]
    let main: OpenWeatherForecastMainDTO
}




