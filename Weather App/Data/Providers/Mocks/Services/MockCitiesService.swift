//
//  MockCitiesService.swift
//  Weather App
//
//  Created by John Guerrero on 9/16/25.
//

enum MockCitiesError: Error {
    case MockedError
}

class MockCitiesService: CitiesService {
    let returnsError: Bool

    init(returnsError: Bool = false) {
        self.returnsError = returnsError
    }

    func fetchCities(forName name: String) async throws -> [City] {
        if returnsError {
            throw MockCitiesError.MockedError
        }

        let citiesDTO = try JSONLoader.loadMock(
            .citiesLatLonByNameMock,
            as: [OpenWeatherCityGeoCodingDTO].self
        )

        return citiesDTO.map { cityDTO in
            OpenWeatherCityGeoCodingMapper().map(cityDTO)
        }
    }
}
