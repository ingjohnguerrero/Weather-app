//
//  OpenWeatherForecastMainDTO.swift
//  Weather App
//
//  Created by John Guerrero on 6/15/25.
//


struct OpenWeatherForecastMainDTO: Decodable {
    let temp: Float
    let feels_like: Float
    let temp_min: Float
    let temp_max: Float
    let pressure: Float
    let humidity: Float
    let sea_level: Float
    let grnd_level: Float
}
