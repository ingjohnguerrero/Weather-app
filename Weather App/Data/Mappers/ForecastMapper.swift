//
//  ForecastMapper.swift
//  Weather App
//
//  Created by John Guerrero on 6/15/25.
//

protocol ForecastMapper {
    associatedtype DTO
    func map(_ dto: DTO) -> Forecast
}
