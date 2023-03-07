//
//  LaunchesModel.swift
//  SpaceX
//
//  Created by Алексей Ходаков on 28.02.2023.
//

import Foundation

// MARK: - LauncheModel
struct LauncheModel: Codable, Identifiable {
    let success: Bool?
    let name, dateUTC: String
    let dateUnix: Int
    let id: String

    enum CodingKeys: String, CodingKey {
        case success
        case name
        case dateUTC = "date_utc"
        case dateUnix = "date_unix"
        case id
    }
}

// MARK: - Alias name
typealias Launches = [LauncheModel]
