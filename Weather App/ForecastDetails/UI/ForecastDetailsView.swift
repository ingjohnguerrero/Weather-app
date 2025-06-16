//
//  ForecastDetailsView.swift
//  Weather App
//
//  Created by John Guerrero on 6/15/25.
//

import SwiftUI

struct ForecastDetailsView: View {
    @State var forecast: Forecast? = nil
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Current Weather Forecast:")
                    .font(.largeTitle)
                    .padding()
                    .navigationTitle(forecast?.name ?? "Weather Forecast")
                VStack(alignment: .center) {
                    Text(forecast?.weather.first?.main ?? "Unknown Weather")
                        .font(.title)
                    Image(systemName: "cloud.sun.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text(forecast?.weather.first?.description ?? "No Description")
                        .font(.title2)
                }
                .padding(.top, 20)
                .padding(.bottom, 20)
                .padding(.horizontal, 40)
                VStack {
                    HStack(){
                        Text("Temp")
                        Spacer()
                        Text("\(forecast?.temp ?? 0) ºC")
                    }
                    HStack{
                        Text("Feels like")
                        Spacer()
                        Text("\(forecast?.feels_like ?? 0) ºC")
                    }
                    HStack{
                        Text("Temorature Min")
                        Spacer()
                        Text("\(forecast?.temp_min ?? 0) ºC")
                    }
                    HStack{
                        Text("Temperature Max")
                        Spacer()
                        Text("\(forecast?.temp_max ?? 0) ºC")
                    }
                    HStack{
                        Text("Pressure")
                        Spacer()
                        Text("\(forecast?.pressure ?? 0) hPa")
                    }
                    HStack{
                        Text("Humidity")
                        Spacer()
                        Text("\(forecast?.humidity ?? 0) %")
                    }
                    HStack{
                        Text("Sea Level")
                        Spacer()
                        Text("\(forecast?.sea_level ?? 0) hPa")
                    }
                    HStack{
                        Text("Ground level")
                        Spacer()
                        Text("\(forecast?.grnd_level ?? 0) hPa")
                    }
                }
                .padding(.horizontal, 40)
            }
        }
    }
}

#Preview {
    let forecast = try! JSONLoader.loadMock(.forecastByLatLngMock, as: OpenWeatherForecastDTO.self)
    ForecastDetailsView(forecast: OpenWeatherForecastMapper().map(forecast) )
}
