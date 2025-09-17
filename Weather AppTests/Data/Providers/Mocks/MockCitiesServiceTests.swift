//
//  MockCitiesServiceTests.swift
//  Weather App
//
//  Created by John Guerrero on 9/16/25.
//

import XCTest
@testable import Weather_App

final class MockCitiesServiceTests: XCTestCase {
    var sut: MockCitiesService!

    func testInitialization() {
        sut = MockCitiesService()
        XCTAssertNotNil(sut)
    }

    func testFetchCities() async throws {
        sut = MockCitiesService()
        let cities = try await sut.fetchCities(forName: "")
        XCTAssertFalse(cities.isEmpty)
    }
}
