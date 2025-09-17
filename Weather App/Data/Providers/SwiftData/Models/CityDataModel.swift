//
//  CityDataModel.swift
//  Weather App
//
//  Created by John Guerrero on 9/17/25.
//

import Foundation
import SwiftData

@Model
final class CityDataModel {
    var id: UUID
    var name: String
    var lat: Float
    var lon: Float
    var country: String
    var state: String?

    init(
        id: UUID,
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

extension CityDataModel: CityMapper {
    func mapToCity() -> City {
        City(
            name: self.name,
            lat: self.lat,
            lon: self.lon,
            country: self.country,
            state: self.state
        )
    }
}
