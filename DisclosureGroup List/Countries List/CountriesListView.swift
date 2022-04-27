//
// Created for DisclosureGroup List
// by Stewart Lynch on 2022-04-26
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import SwiftUI

struct CountriesListView: View {
    @StateObject var viewModel = CountriesListViewModel()
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.cities) { city in
                        VStack(alignment: .leading) {
                            HStack {
                                Text(city.country.flag)
                                Text(city.country.name)
                            }
                            .font(.title3)
                            VStack(alignment: .leading) {
                                Text(city.name)
                                HStack {
                                    Spacer()
                                    Text("**Population:** \(city.population)")
                                        .font(.caption)
                                }
                            }
                        }
                    }
                }
                .listStyle(.plain)
            }
            .onAppear {
                viewModel.loadCitiesAndCountries()
            }
            .navigationBarTitle("Countries List")
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesListView()
    }
}
