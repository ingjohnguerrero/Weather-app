# Weather App

This project is a Swift practice application that demonstrates how to fetch and display weather data using the [OpenWeather One Call API 2.5](https://openweathermap.org/api/one-call-api).

## Features

- Fetches current weather and forecast data from OpenWeather
- Displays weather information in a simple SwiftUI interface
- Demonstrates networking, JSON parsing, and UI updates in Swift

## Getting Started

1. Clone the repository.
2. Open the `Weather App.xcodeproj` in Xcode.
3. Obtain a free API key from [OpenWeather](https://openweathermap.org/appid).
4. Add your API key to the appropriate location in the code (see comments in the networking files).
5. Build and run the app on a simulator or device.

## Project Structure

- `Weather App/` — Main SwiftUI app code
  - `ContentView.swift` — Main content view
  - `Weather_AppApp.swift` — App entry point
  - `Assets.xcassets/` — App assets (icons, colors)
- `ForecastDetails/` — Forecast feature module
  - `Data/`
    - `APIs/OpenWeatherMap/` — DTOs for OpenWeather API responses
      - `OpenWeatherForecastDTO.swift`
      - `OpenWeatherForecastMainDTO.swift`
      - `OpenWeatherForecastWeatherDTO.swift`
  - `Domain/Models/` — Domain models (e.g., `Forecast.swift`)
  - `UI/ForecastDetailsView.swift` — Forecast details UI
- `Weather AppTests/` — Unit tests
  - `Weather_AppTests.swift` — Main app tests
  - `Data/APIs/OpenWeatherMap/` — API DTO tests
    - `OpenWeatherForecastDTOTests.swift`
  - `Domain/Models/` — Domain model tests
    - `ForecastTests.swift`
- `Weather AppUITests/` — UI tests
  - `Weather_AppUITests.swift`
  - `Weather_AppUITestsLaunchTests.swift`
- `LICENSE` — Project license
- `README.md` — Project documentation

## API Reference

- [OpenWeather One Call API 2.5 Documentation](https://openweathermap.org/api/one-call-api)

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
