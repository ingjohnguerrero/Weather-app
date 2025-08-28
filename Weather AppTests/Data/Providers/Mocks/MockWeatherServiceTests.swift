//
//  MockedWeatherService.swift
//  Weather App
//
//  Created by John Guerrero on 6/17/25.
//

import XCTest
@testable import Weather_App

final class MockWeatherServiceTests: XCTestCase {

    var sut: MockWeatherService!

    func testInitialization() {
        sut = MockWeatherService()
        XCTAssertNotNil(sut, "MockWeatherService should be initialized successfully")
    }

    func testFetchWeatherData() async throws{
        sut = MockWeatherService()
        let forecast = try await sut.fetchForecast(forLat: 10, lon: 11)
        XCTAssertNotNil(forecast, "Forecast should not be nil")
    }
}
