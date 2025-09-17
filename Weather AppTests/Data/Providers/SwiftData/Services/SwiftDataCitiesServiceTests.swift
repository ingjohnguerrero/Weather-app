//
//  SwiftDataCitiesServiceTests.swift
//  Weather AppTests
//
//  Created by John Guerrero on 9/17/25.
//

import XCTest
@testable import Weather_App

@MainActor
final class SwiftDataCitiesServiceTests: XCTestCase {

    var sut: SwiftDataCitiesService!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = try SwiftDataCitiesService(inMemory: true)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitialization() {
        XCTAssertNotNil(sut)
    }

    func testSaveCityIncrementsRecentCitiesCount() async throws{
        let city = City(
            name: "San Francisco",
            lat: 37.7749,
            lon: -122.4194,
            country: "US"
        )

        try? await sut.save(city: city)
        let recentCities = try await sut.recentCities()

        XCTAssertEqual(try XCTUnwrap(recentCities.first?.name), city.name)
    }

    func testAllItemsDeletionResultsInEmptyRecentCities() async throws{
        let city = City(
            name: "San Francisco",
            lat: 37.7749,
            lon: -122.4194,
            country: "US"
        )

        try? await sut.save(city: city)
        var recentCities = try await sut.recentCities()

        XCTAssertFalse(recentCities.isEmpty)

        try await sut.deleteAllCities()

        recentCities = try await sut.recentCities()
        XCTAssertTrue(recentCities.isEmpty)
    }
}
