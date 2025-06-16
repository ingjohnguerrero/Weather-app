//
//  WeatherMapper.swift
//  Weather App
//
//  Created by John Guerrero on 6/15/25.
//

protocol WeatherMapper {
    associatedtype DTO
    func map(_ dto: DTO) -> Weather
}
