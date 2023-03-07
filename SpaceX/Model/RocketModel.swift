//
//  RocketsModel.swift
//  SpaceX
//
//  Created by Алексей Ходаков on 28.02.2023.
//

import Foundation

// MARK: - RocketModel
struct RocketModel: Codable, Identifiable, Hashable{
    let height, diameter: Diameter
    let mass: Mass
    let firstStage: FirstStage
    let secondStage: SecondStage
    let engines: Engines
    let payloadWeights: [PayloadWeight]
    let flickrImages: [String]
    let name: String
    let costPerLaunch: Int
    let firstFlight, country: String
    let id: String

    enum CodingKeys: String, CodingKey {
        case height, diameter, mass
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case engines
        case payloadWeights = "payload_weights"
        case flickrImages = "flickr_images"
        case name
        case costPerLaunch = "cost_per_launch"
        case firstFlight = "first_flight"
        case id, country
    }
}

// MARK: - Diameter
struct Diameter: Codable, Hashable {
    let meters, feet: Double?
}

// MARK: - Mass
struct Mass: Codable, Hashable {
    let kg, lb: Int
}

// MARK: - Engines
struct Engines: Codable, Hashable {
    let number: Int
}

// MARK: - FirstStage
struct FirstStage: Codable, Hashable {
    let engines: Int
    let fuelAmountTons: Double
    let burnTimeSEC: Int?

    enum CodingKeys: String, CodingKey {
        case engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSEC = "burn_time_sec"
    }
}

// MARK: - SecondStage
struct SecondStage: Codable, Hashable {
    let engines: Int
    let fuelAmountTons: Double
    let burnTimeSEC: Int?

    enum CodingKeys: String, CodingKey {
        case engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSEC = "burn_time_sec"
    }
}

// MARK: - PayloadWeight
struct PayloadWeight: Codable, Hashable {
    let id, name: String
    let kg, lb: Int
}

// MARK: - Alias name
typealias Rockets = [RocketModel]
