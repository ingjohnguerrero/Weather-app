//
//  WeatherService.swift
//  Weather App
//
//  Created by John Guerrero on 6/17/25.
//

protocol WeatherService {
    func fetchForecast(forLat lat: Float, lon: Float) async throws -> Forecast
}
