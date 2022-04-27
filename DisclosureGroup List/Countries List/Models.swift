//
// Created for DisclosureGroup List
// by Stewart Lynch on 2022-04-26
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import Foundation

struct City: Codable, Identifiable {
    let id: String
    let name: String
    let population: Int
    let country: Country
}

struct Country: Codable, Hashable {
    let name: String
    let flag: String
}
