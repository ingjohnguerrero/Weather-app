//
//  CitiesRepositoryTests.swift
//  Weather App
//
//  Created by John Guerrero on 9/17/25.
//

import XCTest
@testable import Weather_App

final class CitiesRepositoryTests: XCTestCase {

    private var sut: CitiesRepository!
    private var service: CitiesService!
    private var dataStore: SwiftDataCitiesDataStore!

    override func setUpWithError() throws {
        service = MockCitiesService()
        dataStore = try SwiftDataCitiesDataStore(inMemory: true)
        sut = CitiesRepository(
            service: service,
            dataStore: dataStore
        )
    }

    override func tearDown() async throws {
        try await dataStore.deleteAllCities()
    }

    func testInitialization() {
        XCTAssertNotNil(sut)
    }

    func testRetrieveRecentCities() async throws {
        let cities = try await service.fetchCities(forName: "")
        for city in cities {
            try await dataStore.save(city: city)
        }
        let recentCities = try await sut.recentCities()
        XCTAssertFalse(recentCities.isEmpty)
    }

    func testSaveSelectedCityStoreItInRecentCities() async throws {
        let city = City(
            name: "San Francisco",
            lat: 37.7749,
            lon: -122.4194,
            country: "US"
        )
        try await sut.save(city)
        let recentCities = try await sut.recentCities()
        let lastRecentCity = try XCTUnwrap(recentCities.first)
        XCTAssertEqual(city.name, lastRecentCity.name)
    }

    func testFetchingCitiesReturnsCitiesFromService() async throws {
        let cities = try await service.fetchCities(forName: "San Francisco")
        let fetchedCities = try await sut.fetchCities(forName: "San Francisco")
        XCTAssertEqual(cities.count, fetchedCities.count)
    }
}
