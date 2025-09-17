//
//  CitiesService.swift
//  Weather App
//
//  Created by John Guerrero on 9/16/25.
//

protocol CitiesService {
    func fetchCities(forName name: String) async throws -> [City]
}
