//
//  Forecast.swift
//  Weather App
//
//  Created by John Guerrero on 6/15/25.
//

struct Forecast {
    let name: String
    let temp: Float
    let feels_like: Float
    let temp_min: Float
    let temp_max: Float
    let pressure: Float
    let humidity: Float
    let sea_level: Float
    let grnd_level: Float
    let weather: [Weather]
}

struct Weather {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
