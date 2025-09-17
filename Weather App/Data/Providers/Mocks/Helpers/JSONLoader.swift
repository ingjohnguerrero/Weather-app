//
//  JSONLoader.swift
//  Weather App
//
//  Created by John Guerrero on 6/15/25.
//

import Foundation

public enum JSONLoaderError: Error {
    case missingFile(String)
    case decodingFailed(Error)
}

public enum MockFile: String {
    case forecastByLatLonMock = "forecast_by_lat_lng_mock"
    case citiesLatLonByNameMock = "cities_lat_lon_by_name_mock"
}

public final class JSONLoader {
    public static func load<T: Decodable>(_ filename: String, as type: T.Type) throws -> T {
        let bundle = Bundle.main
        guard let url = bundle.url(forResource: filename, withExtension: "json") else {
            throw JSONLoaderError.missingFile(filename)
        }

        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw JSONLoaderError.decodingFailed(error)
        }
    }

    public static func loadMock<T: Decodable>(_ mockFile: MockFile, as type: T.Type) throws -> T {
        return try load(mockFile.rawValue, as: type)
    }
}
