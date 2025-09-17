//
//  OpenWeatherCityGeoCodingMapper.swift
//  Weather App
//
//  Created by John Guerrero on 9/16/25.
//

struct OpenWeatherCityGeoCodingMapper: CityMapper {
    func map(_ dto: OpenWeatherCityGeoCodingDTO) -> City {
        return City(
            name: dto.name,
            lat: dto.lat,
            lon: dto.lon,
            country: dto.country,
            state: dto.state
        )
    }
}
