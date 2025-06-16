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

    func testInitialState() async {
        sut = ForecastDetailsViewModel()
        XCTAssertEqual(sut.state, ForecastDetailsState.idle)
    }

    func testLoadForecastWithReturnsForecast() async {
        sut = ForecastDetailsViewModel()
        await sut.loadForecast()
        if case .success(let forecast) = sut.state {
            XCTAssertFalse(forecast.name.isEmpty)
        } else {
            XCTFail("Expected success state with forecast, but got \(sut.state)")
        }
    }
}

