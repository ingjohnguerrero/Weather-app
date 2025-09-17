//
//  CitiesRepository.swift
//  Weather App
//
//  Created by John Guerrero on 9/17/25.
//

actor CitiesRepository {
    private let service: CitiesService
    private let dataStore: SwiftDataCitiesService

    init(service: CitiesService, dataStore: SwiftDataCitiesService) {
        self.service = service
        self.dataStore = dataStore
    }

    func recentCities() async throws -> [City] {
        try await dataStore.recentCities()
    }

    func save(_ city: City) async throws {
        try await dataStore.save(city: city)
    }
}
