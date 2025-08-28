//
//  OWMWeatherServiceTests.swift
//  Weather App
//
//  Created by John Guerrero on 6/17/25.
//

import XCTest
@testable import Weather_App

final class OWMWeatherServiceTests: XCTestCase {
    var sut: OWMWeatherService!

    override func setUpWithError() throws {
        super.setUp()
        sut = OWMWeatherService()
    }

    func testInitNotNil() {
        XCTAssertNotNil(sut)
    }

    func testFetchForecastWithValidApiKeyReturnsValidForecast() async throws {
        let forecast = try? await sut.fetchForecast(forLat: 37.7749, lon: -122.4194)
        XCTAssertNotNil(forecast)
    }

}

