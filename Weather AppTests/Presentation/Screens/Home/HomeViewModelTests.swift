//
//  HomeViewModelTests.swift
//  Weather App
//
//  Created by John Guerrero on 9/16/25.
//

import XCTest
@testable import Weather_App

@MainActor
final class HomeViewModelTests: XCTestCase {
    var sut: HomeViewModel!

    func testInitialState() {
        sut = HomeViewModel(service: MockCitiesService())
        XCTAssertEqual(sut.state, HomeState.idle)
    }

    func testLookupCities() async throws {
        sut = HomeViewModel(service: MockCitiesService())
        await sut.lookForCities(query: "Londres")
        if case .loaded(let cities) = sut.state {
            XCTAssertGreaterThan(cities.count, 0)
        } else {
            XCTFail("Expected loaded state, but got \(sut.state)")
        }
    }

    func testLookupCitiesError() async throws {
        sut = HomeViewModel(service: MockCitiesService(returnsError: true))
        await sut.lookForCities(query: "Invalid Query")
        if case .error(let errorMessage) = sut.state {
            XCTAssertFalse(errorMessage.isEmpty, "Expected non-empty error message")
        } else {
            XCTFail("Expected error state, but got \(sut.state)")
        }
    }
}
