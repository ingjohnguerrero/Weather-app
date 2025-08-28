# Weather App

This project is a Swift practice application that demonstrates how to fetch and display weather data using the [OpenWeather One Call API 2.5](https://openweathermap.org/api/one-call-api).

## Features

- Fetches current weather and forecast data from OpenWeather
- Displays weather information in a simple SwiftUI interface
- Demonstrates networking, JSON parsing, and UI updates in Swift

| **Mobile Interface** |
|------------|
|<img src="https://github.com/user-attachments/assets/0538b7ee-ee3e-4261-82e4-1f083ad145c6" alt="iPhone 16 Pro Simulator Screenshot" width="300"><br><sub>iPhone 16 Pro Simulator View</sub> |

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
  - `Data/` — Data layer
    - `Mappers/` — Data mapping logic
      - `ForecastMapper.swift`, `WeatherMapper.swift`
    - `Mocks/` — Mock data for testing
      - `forecast_by_lat_lng_mock.json`
      - `Helpers/JSONLoader.swift` — Utility for loading JSON mocks
    - `Providers/OpenWeatherMap/` — OpenWeather API DTOs and mappers
      - `OpenWeatherForecastDTO.swift`, `OpenWeatherForecastMainDTO.swift`, `OpenWeatherForecastWeatherDTO.swift`, `OpenWeatherForecastMapper.swift`
  - `Domain/Models/` — Domain models (e.g., `Forecast.swift`)
  - `Presentation/Screens/ForecastDetails/` — UI and ViewModel for forecast details
    - `ForecastDetailsView.swift`, `ForecastDetailsViewModel.swift`
- `Weather AppTests/` — Unit tests
  - `Weather_AppTests.swift` — Main app tests
  - `Data/` — Data layer tests
    - `Domain/Models/ForecastTests.swift`
    - `Mocks/Helpers/JSONLoaderTests.swift`
    - `Providers/OpenWeatherMap/` — API DTO and mapper tests
      - `OpenWeatherForecastDTOTests.swift`, `OpenWeatherForecastMapperTests.swift`
    - `Presentation/Screens/ForecastDetailsViewModelTests.swift`
- `Weather AppUITests/` — UI tests
  - `Weather_AppUITests.swift`, `Weather_AppUITestsLaunchTests.swift`
- `Weather App.xcodeproj/` — Xcode project files
- `LICENSE` — Project license
- `README.md` — Project documentation

## API Reference

- [OpenWeather One Call API 2.5 Documentation](https://openweathermap.org/api/one-call-api)

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
