//
//  CityMapper.swift
//  Weather App
//
//  Created by John Guerrero on 9/16/25.
//

protocol CityMapper {
    associatedtype DTO
    func map(_ dto: DTO) -> City
}
