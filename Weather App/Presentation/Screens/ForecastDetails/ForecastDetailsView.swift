//
//  ForecastDetailsView.swift
//  Weather App
//
//  Created by John Guerrero on 6/15/25.
//

import SwiftUI

struct ForecastDetailsView: View {
    let lat: Float
    let lon: Float
    @State var viewModel = ForecastDetailsViewModel()
    var body: some View {
        ScrollView {
            switch viewModel.state {
                case .idle, .loading:
                    ProgressView("Loading Forecast...")
                        .padding()
                case .success(let forecast):
                    contentView(forecast: forecast)
                case .error(let description):
                    Text("Error loading forecast: \(description)")

            }
        }
        .task {
            await viewModel.loadForecast(lat: lat, lon: lon)
        }
    }

    @ViewBuilder
    private func contentView (forecast: Forecast) -> some View {
        VStack(alignment: .leading) {
            Text("Current Weather Forecast:")
                .font(.largeTitle)
                .padding()
                .navigationTitle(forecast.name)
            VStack(alignment: .center) {
                Text(forecast.weather.first?.main ?? "Unknown Weather")
                    .font(.title)
                Image(systemName: "cloud.sun.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text(forecast.weather.first?.description ?? "No Description")
                    .font(.title2)
            }
            .padding(.top, 20)
            .padding(.bottom, 20)
            .padding(.horizontal, 40)
            VStack {
                HStack(){
                    Text("Temp")
                    Spacer()
                    Text("\(forecast.temp) ºC")
                }
                HStack{
                    Text("Feels like")
                    Spacer()
                    Text("\(forecast.feels_like) ºC")
                }
                HStack{
                    Text("Temperature Min")
                    Spacer()
                    Text("\(forecast.temp_min) ºC")
                }
                HStack{
                    Text("Temperature Max")
                    Spacer()
                    Text("\(forecast.temp_max) ºC")
                }
                HStack{
                    Text("Pressure")
                    Spacer()
                    Text("\(forecast.pressure) hPa")
                }
                HStack{
                    Text("Humidity")
                    Spacer()
                    Text("\(forecast.humidity) %")
                }
                HStack{
                    Text("Sea Level")
                    Spacer()
                    Text("\(forecast.sea_level) hPa")
                }
                HStack{
                    Text("Ground level")
                    Spacer()
                    Text("\(forecast.grnd_level) hPa")
                }
            }
            .padding(.horizontal, 40)
        }
    }
}

#Preview {
    let viewModel = ForecastDetailsViewModel(service: MockWeatherService())
    ForecastDetailsView(lat: 0.0, lon: 0.0, viewModel: viewModel)
}
