//
//  ForecastDetailsView.swift
//  Weather App
//
//  Created by John Guerrero on 6/15/25.
//

import SwiftUI

struct ForecastDetailsView: View {
    @State private var city: String = "San Francisco"
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Current Weather Forecast:")
                    .font(.largeTitle)
                    .padding()
                    .navigationTitle(city)
                VStack(alignment: .center) {
                    Text("Sunny")
                        .font(.title)
                    Image(systemName: "cloud.sun.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text("Really sunny day")
                        .font(.title2)
                }
                .padding(.top, 20)
                .padding(.bottom, 20)
                .padding(.horizontal, 40)
                VStack {
                    HStack(){
                        Text("Temp")
                        Spacer()
                        Text("20 ºC")
                    }
                    HStack{
                        Text("Feels like")
                        Spacer()
                        Text("21 ºC")
                    }
                    HStack{
                        Text("Temorature Min")
                        Spacer()
                        Text("8 ºC")
                    }
                    HStack{
                        Text("Temperature Max")
                        Spacer()
                        Text("25 ºC")
                    }
                    HStack{
                        Text("Pressure")
                        Spacer()
                        Text("1013 hPa")
                    }
                    HStack{
                        Text("Humidity")
                        Spacer()
                        Text("60%")
                    }
                    HStack{
                        Text("Sea Level")
                        Spacer()
                        Text("1013 hPa")
                    }
                    HStack{
                        Text("Ground level")
                        Spacer()
                        Text("950 hPa")
                    }
                }
                .padding(.horizontal, 40)
            }
        }
    }
}

#Preview {
    ForecastDetailsView()
}
