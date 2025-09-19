//
//  SwiftDataCitiesDataStore.swift
//  Weather App
//
//  Created by John Guerrero on 9/17/25.
//

import Foundation
import SwiftData

protocol CitiesDataStore {
    func save(city: City) async throws
    func recentCities() async throws -> [City]
    func deleteAllCities() async throws
}

// ModelActor ensures its modelContainer/modelContext are created and used
// on the same actor executor, preventing "Unbinding from the main queue".
@ModelActor
actor SwiftDataCitiesDataStore: CitiesDataStore {
    nonisolated let recentCitiesLimit = 10

    // ModelActor provides:
    // nonisolated let modelContainer: ModelContainer
    // nonisolated let modelExecutor: any ModelExecutor
    // var modelContext: ModelContext { get }  // actor-isolated

    // Provide a configuration for the model container
    init(inMemory: Bool = false) throws {
        let schema = Schema([CityDataModel.self])
        let config = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: inMemory
        )
        try self.init(modelContainer: .init(for: schema, configurations: [config]))
    }

    func save(city: City) throws {
        // Prevent duplicates by ID
        guard fetchCity(byId: city.id) == nil else {
            return
        }

        let recentCities: [City] = (try? self.recentCities()) ?? []
        if recentCities.count >= recentCitiesLimit {
            try deleteOldestCity()
        }

        let item = CityDataModel(
            id: city.id,
            name: city.name,
            lat: city.lat,
            lon: city.lon,
            country: city.country,
            state: city.state,
            createdAt: Date()
        )
        modelContext.insert(item)
        try modelContext.save()
    }

    func recentCities() throws -> [City] {
        var descriptor = FetchDescriptor<CityDataModel>(
            // If you want most-recent-first, use .reverse; otherwise .forward.
            sortBy: [SortDescriptor(\CityDataModel.createdAt, order: .forward)]
        )
        descriptor.fetchLimit = recentCitiesLimit
        let recentCityDataModels = try modelContext.fetch(descriptor)
        return recentCityDataModels.map { $0.mapToCity() }
    }

    func deleteOldestCity() throws {
        let descriptor = FetchDescriptor<CityDataModel>(
            sortBy: [SortDescriptor(\CityDataModel.createdAt, order: .forward)]
        )
        guard let oldestCityDataModel = try? modelContext.fetch(descriptor).first else {
            return
        }
        modelContext.delete(oldestCityDataModel)
        try modelContext.save()
    }

    func deleteAllCities() throws {
        let items = try modelContext.fetch(FetchDescriptor<CityDataModel>())
        for item in items {
            modelContext.delete(item)
        }
        try modelContext.save()
    }

    private func fetchCity(byId id: String) -> City? {
        let descriptor = FetchDescriptor<CityDataModel>(
            predicate: #Predicate { $0.id == id }
        )
        guard
            let city = try? modelContext.fetch(descriptor).first?.mapToCity()
        else {
            return nil
        }
        return city
    }
}
