//
//  OWMCitiesServiceTests.swift
//  Weather App
//
//  Created by John Guerrero on 9/16/25.
//

import XCTest
@testable import Weather_App

final class OWMCitiesServiceTests: XCTestCase {
    var sut: OWMCitiesService!

    override func setUpWithError() throws {
        super.setUp()
        sut = OWMCitiesService()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }

    func testInitNotNil() {
        XCTAssertNotNil(sut)
    }

    func testFetchCitiesWithValirApiKeyReturnsValidCitiesGeocoding() async throws {
        let cities = try? await sut.fetchCities(forName: "Toronto")
        XCTAssertNotNil(cities)
        XCTAssertGreaterThan(cities!.count, 0)
    }
}
