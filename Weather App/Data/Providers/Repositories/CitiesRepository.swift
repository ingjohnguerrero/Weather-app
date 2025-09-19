//
//  CitiesRepository.swift
//  Weather App
//
//  Created by John Guerrero on 9/17/25.
//

actor CitiesRepository {
    private let service: CitiesService
    private let dataStore: CitiesDataStore

    init(service: CitiesService, dataStore: CitiesDataStore) {
        self.service = service
        self.dataStore = dataStore
    }

    func fetchCities(forName: String) async throws -> [City] {
        try await service.fetchCities(forName: forName)
    }

    func recentCities() async throws -> [City] {
        try await dataStore.recentCities()
    }

    func save(_ city: City) async throws {
        try await dataStore.save(city: city)
    }
}
