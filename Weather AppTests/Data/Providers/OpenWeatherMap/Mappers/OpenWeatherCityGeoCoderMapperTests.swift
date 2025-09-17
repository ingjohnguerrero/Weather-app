//
//  OpenWeatherCityGeoCoderMapperTests.swift
//  Weather App
//
//  Created by John Guerrero on 9/16/25.
//

import XCTest
@testable import Weather_App

final class OpenWeatherCityGeoCoderMapperTests: XCTestCase {

    var citiesDTO: [OpenWeatherCityGeoCodingDTO]!
    var cities: [City]!

    let responseString = """
    [
        {
            "name": "London",
            "local_names": {
                "bi": "London",
                "ro": "Londra"
            },
            "lat": 51.5073219,
            "lon": -0.1276474,
            "country": "GB",
            "state": "England"
        },
        {
            "name": "City of London",
            "local_names": {
                "uk": "Лондонське Сіті",
                "he": "הסיטי של לונדון",
                "zh": "倫敦市",
                "en": "City of London",
                "pt": "Cidade de Londres",
                "ko": "시티 오브 런던",
                "es": "City de Londres",
                "ur": "لندن شہر",
                "fr": "Cité de Londres",
                "hi": "सिटी ऑफ़ लंदन",
                "ru": "Сити",
                "lt": "Londono Sitis"
            },
            "lat": 51.5156177,
            "lon": -0.0919983,
            "country": "GB",
            "state": "England"
        },
        {
            "name": "London",
            "local_names": {
                "bn": "লন্ডন",
                "yi": "לאנדאן",
                "oj": "Baketigweyaang",
                "ug": "لوندۇن",
                "iu": "ᓚᓐᑕᓐ",
                "th": "ลอนดอน",
                "el": "Λόντον",
                "ar": "لندن",
                "lt": "Londonas",
                "fa": "لندن",
                "be": "Лондан",
                "hy": "Լոնտոն",
                "ga": "Londain",
                "cr": "ᓬᐊᐣᑕᐣ",
                "lv": "Landona",
                "fr": "London",
                "en": "London",
                "he": "לונדון",
                "ru": "Лондон",
                "ko": "런던",
                "ja": "ロンドン",
                "ka": "ლონდონი"
            },
            "lat": 42.9832406,
            "lon": -81.243372,
            "country": "CA",
            "state": "Ontario"
        },
        {
            "name": "Chelsea",
            "local_names": {
                "pl": "Chelsea",
                "uk": "Челсі",
                "sh": "Chelsea, London",
                "no": "Chelsea",
                "af": "Chelsea, Londen",
                "ru": "Челси",
                "el": "Τσέλσι",
                "tr": "Chelsea, Londra",
                "ga": "Chelsea",
                "es": "Chelsea",
                "id": "Chelsea, London",
                "fa": "چلسی",
                "ko": "첼시",
                "hi": "चेल्सी, लंदन",
                "it": "Chelsea",
                "ar": "تشيلسي",
                "ur": "چیلسی، لندن",
                "de": "Chelsea",
                "sk": "Chelsea",
                "sv": "Chelsea, London",
                "he": "צ'לסי",
                "hu": "Chelsea",
                "zh": "車路士",
                "nl": "Chelsea",
                "vi": "Chelsea, Luân Đôn",
                "et": "Chelsea",
                "en": "Chelsea",
                "fr": "Chelsea",
                "pt": "Chelsea",
                "eu": "Chelsea",
                "az": "Çelsi",
                "da": "Chelsea",
                "ja": "チェルシー"
            },
            "lat": 51.4875167,
            "lon": -0.1687007,
            "country": "GB",
            "state": "England"
        },
        {
            "name": "London",
            "lat": 37.1289771,
            "lon": -84.0832646,
            "country": "US",
            "state": "Kentucky"
        }
    ]
    """

    override func setUp() {
        super.setUp()
        do {
            let data = responseString.data(using: .utf8)
            citiesDTO = try JSONDecoder()
                .decode(
                    [OpenWeatherCityGeoCodingDTO].self,
                    from: XCTUnwrap(data)
                )
        } catch {
            XCTFail("Failed to decode JSON: \(error.localizedDescription)")
        }
    }

    func testCitiesMapperReturnsCorrectNumberOfCities() {
        cities = citiesDTO.map({ cityDTO in
            cityDTO.mapToCity()
        })
        XCTAssertEqual(citiesDTO.count, 5)
    }
}
