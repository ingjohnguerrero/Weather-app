//
//  HomeView.swift
//  Weather App
//
//  Created by John Guerrero on 9/16/25.
//

import SwiftUI

struct HomeView: View {
    @State var viewModel = HomeViewModel()
    @State var searchText: String = ""

    var body: some View {
        NavigationView {
            Group {
                switch viewModel.state {
                    case .idle:
                        Text("Enter a city name to get the weather")
                    case .loading:
                        ProgressView("Loading cities")
                            .padding()
                    case .loaded(let cities):
                        citiesList(cities)
                    case .error(let description):
                        Text("Error fetching cities: \(description)")
                }
            }
        }
        .searchable(text: $searchText, prompt: "City name")
        .onChange(of: searchText) { oldValue, newValue in
            Task {
                await viewModel.lookForCities(query: newValue)
            }
        }
    }

    @ViewBuilder
    private func citiesList(_ cities: [City]) -> some View {
        List(cities) { city in
            NavigationLink(
                destination: ForecastDetailsView(lat: city.lat, lon: city.lon)
            ) {
                VStack {
                    Text("\(city.name), \(city.country)")
                    if let state = city.state {
                        Text(state)
                    }
                }
            }
        }
    }
}

#Preview {
    let viewModel = HomeViewModel(service: MockCitiesService())
    HomeView(viewModel: viewModel)
}
