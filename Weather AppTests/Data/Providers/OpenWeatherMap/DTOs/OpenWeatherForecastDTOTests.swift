//
//  OpenWeatherForecastDTOTests.swift
//  Weather App
//
//  Created by John Guerrero on 6/15/25.
//
import XCTest
@testable import Weather_App

final class OpenWeatherForecastDTOTests: XCTestCase {
    let responseString = """
        {
            "coord": {
                "lon": 10.99,
                "lat": 44.34
            },
            "weather": [
            {
                "id": 500,
                "main": "Rain",
                "description": "light rain",
                "icon": "10d"
            }
            ],
            "base": "stations",
            "main": {
                "temp": 26.65,
                "feels_like": 26.65,
                "temp_min": 26.23,
                "temp_max": 26.65,
                "pressure": 1015,
                "humidity": 69,
                "sea_level": 1015,
                "grnd_level": 949
            },
            "visibility": 10000,
            "wind": {
                "speed": 3.62,
                "deg": 214,
                "gust": 5.78
            },
            "rain": {
                "1h": 0.13
            },
            "clouds": {
                "all": 82
            },
            "dt": 1750005348,
            "sys": {
                "type": 1,
                "id": 6812,
                "country": "IT",
                "sunrise": 1749958281,
                "sunset": 1750014110
            },
            "timezone": 7200,
            "id": 3163858,
            "name": "Zocca",
            "cod": 200
        }
        """

    func testDecodeObjectFromJSONStringReturnsValidDTO() throws {
        let data = responseString.data(using: .utf8)!
        let forecast = try JSONDecoder().decode(
            OpenWeatherForecastDTO.self,
            from: data
        )

        XCTAssertEqual(forecast.name, "Zocca")
        XCTAssert(forecast.name.count > 0)
        XCTAssertEqual(forecast.main.feels_like, 26.65)
        let weather = try XCTUnwrap(forecast.weather.first)
        XCTAssertEqual(weather.description, "light rain")
    }
}

