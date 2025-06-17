//
//  OpenWeatherForecastMapper.swift
//  Weather App
//
//  Created by John Guerrero on 6/15/25.
//

struct OpenWeatherForecastMapper: ForecastMapper {
    func map(_ dto: OpenWeatherForecastDTO) -> Forecast {
        Forecast(
            name: dto.name,
            temp: dto.main.temp,
            feels_like: dto.main.feels_like,
            temp_min: dto.main.temp_min,
            temp_max: dto.main.temp_max,
            pressure: dto.main.pressure,
            humidity: dto.main.humidity,
            sea_level: dto.main.sea_level,
            grnd_level: dto.main.grnd_level,
            weather: dto.weather.map { weatherDTO in
                let mapper = OpenWeatherForecastWeatherMapper()
                return mapper.map(weatherDTO)
            }
        )
    }
}

struct OpenWeatherForecastWeatherMapper: WeatherMapper {
    func map(_ dto: OpenWeatherForecastWeatherDTO) -> Weather {
        Weather(
            id: dto.id,
            main: dto.main,
            description: dto.description,
            icon: dto.icon
        )
    }
}
