//
//  OpenWeatherForecastMapperTests.swift
//  Weather App
//
//  Created by John Guerrero on 6/15/25.
//
import XCTest
@testable import Weather_App

final class OpenWeatherForecastMapperTests: XCTestCase {
    var sut: OpenWeatherForecastMapper!
    var forecastDTO: OpenWeatherForecastDTO!

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

    override func setUp() {
        super.setUp()
        let data = responseString.data(using: .utf8)!
        do {
            forecastDTO = try JSONDecoder().decode(
                OpenWeatherForecastDTO.self,
                from: data
            )
        } catch {
            XCTFail("Failed to decode JSON: \(error.localizedDescription)")
        }

        sut = OpenWeatherForecastMapper()
    }

    func testForecastMapperReturnsValidForecast() throws {
        let mapper = try XCTUnwrap(sut)
        let forecast = mapper.map(forecastDTO)
        XCTAssertEqual(forecast.name, "Zocca")
        XCTAssertEqual(forecast.weather.count, 1)
    }

}

