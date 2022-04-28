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
                HStack {
                    Spacer()
                    Button("Expand all \(Image(systemName: "chevron.right"))") {
                        withAnimation {
                            viewModel.expand(true)
                        }
                    }
                    .disabled(viewModel.allExpanded)
                    Button("Collapse all \(Image(systemName: "chevron.down"))") {
                        withAnimation {
                            viewModel.expand(false)
                        }
                    }
                    .disabled(viewModel.allCollapsed)
                }
                .padding()
                List {
                    ForEach($viewModel.countries, id: \.name) { $country in
                        DisclosureGroup(isExpanded: $country.open) {
                            ForEach(viewModel.countriesDict[country] ?? []) { city in
                                VStack(alignment: .leading) {
                                    Text(city.name)
                                    HStack {
                                        Spacer()
                                        Text("**Population:** \(city.population)")
                                            .font(.caption)
                                    }
                                }
                            }
                        } label: {
                            HStack {
                                Text(country.flag)
                                Text(country.name)
                            }
                            .font(.title3)
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
