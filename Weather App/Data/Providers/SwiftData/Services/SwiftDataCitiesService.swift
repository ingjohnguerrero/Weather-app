//
//  SwiftDataCitiesService.swift
//  Weather App
//
//  Created by John Guerrero on 9/17/25.
//

import Foundation
import SwiftData

actor SwiftDataCitiesService {
    private let container: ModelContainer
    private let context: ModelContext
    let recentCitiesLimit = 5

    init(inMemory: Bool = false) throws {
        let schema = Schema([CityDataModel.self])
        let config = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: inMemory
        )
        container = try ModelContainer(for: schema, configurations: [config])
        context = ModelContext(container)
    }

    func save(city: City) throws {
        let item = CityDataModel(
            id: city.id,
            name: city.name,
            lat: city.lat,
            lon: city.lon,
            country: city.country,
            state: city.state
        )
        context.insert(item)
        try context.save()
    }

    func recentCities() throws -> [City] {
        let descriptor = FetchDescriptor<CityDataModel>(
            sortBy: [SortDescriptor(\CityDataModel.name, order: .forward)]
        )
        let recentCities = try context.fetch(descriptor)
        return recentCities.map { $0.mapToCity() }
    }

    func deleteAllCities() throws {
        let items = try context.fetch(FetchDescriptor<CityDataModel>())
        for item in items {
            context.delete(item)
        }
        try context.save()
    }
}
