//
//  JSONLoaderTests.swift
//  Weather App
//
//  Created by John Guerrero on 6/15/25.
//

import XCTest
@testable import Weather_App

final class JSONLoaderTests: XCTestCase {
    func testParseJsonFileReturnsDTO() throws {
        let dto: OpenWeatherForecastDTO = try JSONLoader.load(
            "forecast_by_lat_lng_mock",
            as: OpenWeatherForecastDTO.self
        )
        XCTAssertEqual(dto.name, "Zocca")
    }

    func testParseMockFileJsonFileReturnsDTO() throws {
        let dto: OpenWeatherForecastDTO = try JSONLoader.loadMock(
            .forecastByLatLngMock,
            as: OpenWeatherForecastDTO.self
        )
        XCTAssertEqual(dto.name, "Zocca")
    }
}

