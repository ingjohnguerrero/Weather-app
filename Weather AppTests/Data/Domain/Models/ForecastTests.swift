//
//  ForecastTests.swift
//  Weather App
//
//  Created by John Guerrero on 6/15/25.
//

import XCTest
@testable import Weather_App

final class ForecastTests: XCTestCase {
    var sut: Forecast!
    var weather: [Weather]!
    override func setUp() {
        weather = [.init(id: 500, main: "Rain", description: "light rain", icon: "10d")]
        sut = .init(
            name: "Zocca",
            temp: 20.0,
            feels_like: 21.0,
            temp_min: 8,
            temp_max: 25,
            pressure: 1015,
            humidity: 69,
            sea_level: 1015,
            grnd_level: 949, weather: weather
        )
    }
    func testInitInstanceIsNotNil() throws {
        XCTAssertNotNil(sut)
        XCTAssertTrue(sut.weather.count == 1)
    }
}
