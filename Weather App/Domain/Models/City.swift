//
//  City.swift
//  Weather App
//
//  Created by John Guerrero on 9/16/25.
//

import Foundation

struct City: Identifiable {
    var id: UUID
    let name: String
    let lat: Float
    let lon: Float
    let country: String
    let state: String?

    init(
        id: UUID = UUID(),
        name: String,
        lat: Float,
        lon: Float,
        country: String,
        state: String? = nil
    ) {
        self.id = id
        self.name = name
        self.lat = lat
        self.lon = lon
        self.country = country
        self.state = state
    }
}
