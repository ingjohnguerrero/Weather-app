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
        sut = OWMWeatherService(apiKey: "")
    }

    func testInitNotNil() {
        XCTAssertNotNil(sut)
    }

}

