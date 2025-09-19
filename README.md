# Weather App

This project is a Swift practice application that demonstrates how to fetch and display weather data using the [OpenWeather One Call API 2.5](https://openweathermap.org/api/one-call-api).

## Features

- Fetches current weather and forecast data from OpenWeather
- Displays weather information in a simple SwiftUI interface
- Demonstrates networking, JSON parsing, and UI updates in Swift

| **Mobile Interface** |
|------------|
|<video src="https://github.com/user-attachments/assets/904bdbae-6147-4a30-86ae-3cee3349d709" controls width="500"></video><br><sub>iPhone 17 Pro Simulator</sub> |

## Getting Started

1. Clone the repository.
2. Open the `Weather App.xcodeproj` in Xcode.
3. Obtain a free API key from [OpenWeather](https://openweathermap.org/appid).
4. Add your API key to the appropriate location in the code (see comments in the networking files).
5. Build and run the app on a simulator or device.

## Project Structure

- `Weather App/` — Main SwiftUI app code
  - `Weather_AppApp.swift` — App entry point
  - `Assets.xcassets/` — App assets (icons, colors)
  - `Presentation/`
    - `Screens/`
      - `Home/`
        - `HomeView.swift`
        - `HomeViewModel.swift`
      - `ForecastDetails/`
        - `ForecastDetailsView.swift`
        - `ForecastDetailsViewModel.swift`
  - `Domain/`
    - `Models/`
      - `Forecast.swift`
      - `City.swift`
    - `Services/`
      - `WeatherService.swift`
      - `CitiesService.swift`
  - `Data/`
    - `Mappers/`
      - `ForecastMapper.swift`, `WeatherMapper.swift`
    - `Providers/`
      - `OpenWeatherMap/`
        - `DTOs/`
          - `OpenWeatherForecastDTO.swift`, `OpenWeatherForecastMainDTO.swift`, `OpenWeatherForecastWeatherDTO.swift`
          - `OpenWeatherCityGeoCodingDTO.swift` (if present; used by cities lookup)
        - `Mappers/`
          - `OpenWeatherForecastMapper.swift`
          - `OpenWeatherCityGeocodingMapper.swift` (if present; maps city geocoding DTO to Domain City)
        - `Services/`
          - `OWMWeatherService.swift`
          - `OWMCitiesService.swift`
      - `Mocks/`
        - `forecast_by_lat_lng_mock.json`
        - `citiesLatLonByNameMock.json` (if present; used by MockCitiesService)
        - `Helpers/`
          - `JSONLoader.swift` — Utility for loading JSON mocks
        - `Services/`
          - `MockWeatherService.swift`
          - `MockCitiesService.swift`
      - `Stores/`
        - `CitiesDataStore.swift` (e.g., SwiftData-backed store; name may vary)
- `Weather AppTests/` — Unit tests
  - `Weather_AppTests.swift` — Main app tests
  - `Data/`
    - `Domain/Models/`
      - `ForecastTests.swift`
    - `Providers/Mocks/`
      - `MockWeatherServiceTests.swift`
      - `Helpers/JSONLoaderTests.swift`
      - `MockCitiesServiceTests.swift` (if present)
    - `Providers/OpenWeatherMap/`
      - `DTOs/OpenWeatherForecastDTOTests.swift`
      - `Mappers/OpenWeatherForecastMapperTests.swift`
      - `Services/OWMWeatherServiceTests.swift`
      - `Services/OWMCitiesServiceTests.swift` (if present)
  - `Presentation/Screens/`
    - `ForecastDetails/ForecastDetailsViewModelTests.swift`
    - `Home/HomeViewModelTests.swift` (if present)
- `Weather AppUITests/` — UI tests
  - `Weather_AppUITests.swift`, `Weather_AppUITestsLaunchTests.swift`
- `TestPlans/` — Xcode test plans
  - `WeatherApp.xctestplan`, `WeatherAppIntegration.xctestplan`
- `XCConfigs/` — Xcode configuration files
  - `Debug.xcconfig`
- `Weather-App-Info.plist` — App info plist
- `LICENSE` — Project license
- `README.md` — Project documentation
- `Weather App.xcodeproj/` — Xcode project files

## API Reference

- [OpenWeather One Call API 2.5 Documentation](https://openweathermap.org/api/one-call-api)

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Releases

- 2.0 — 2025-09-18
  - Highlights: [Add key new features here, e.g., city search, multi-day forecast, Swift Concurrency adoption, etc.]
  - Changes:
    - [Refactor Forecast Details Initialization]
    - [Adds HomeView with city search box]
    - [Adds Navigation to Forecast details]
    - [Adds City name geocoding to get forecast details]
    - [Adds CitiesDataStore for recent cities implementing SwiftData]

- 1.0 — 2025-08-27
  - Initial release
  - Features:
    - [Forecast Details Module]
