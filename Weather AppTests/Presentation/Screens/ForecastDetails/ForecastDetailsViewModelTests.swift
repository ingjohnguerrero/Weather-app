//
//  ForecastDetailsViewModelTests.swift
//  Weather App
//
//  Created by John Guerrero on 6/15/25.
//

import XCTest
@testable import Weather_App

@MainActor
final class ForecastDetailsViewModelTests: XCTestCase {
    var sut: ForecastDetailsViewModel!
    let city = City(
        name: "San Francisco",
        lat: 37.7749,
        lon: -122.4194,
        country: "US"
    )

    func testInitialState() async {
        sut = ForecastDetailsViewModel(
            service: MockWeatherService()
        )
        XCTAssertEqual(sut.state, ForecastDetailsState.idle)
    }

    func testLoadForecastWithReturnsForecast() async {
        sut = ForecastDetailsViewModel(
            service: MockWeatherService()
        )
        await sut.loadForecast(city)
        if case .success(let forecast) = sut.state {
            XCTAssertFalse(forecast.name.isEmpty)
        } else {
            XCTFail("Expected success state with forecast, but got \(sut.state)")
        }
    }

    // Add an error ForecastDetailsState test
    func testLoadForecastWithError() async {
        sut = ForecastDetailsViewModel(
            service: MockWeatherService(returnsError: true)
        )
        await sut.loadForecast(city)
        if case .error(let errorMessage) = sut.state {
            XCTAssertFalse(errorMessage.isEmpty, "Expected an error message but got empty string")
        } else {
            XCTFail("Expected error state, but got \(sut.state)")
        }
    }
}

