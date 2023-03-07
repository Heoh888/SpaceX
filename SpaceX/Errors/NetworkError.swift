//
//  NetworkError.swift
//  SpaceX
//
//  Created by Алексей Ходаков on 05.03.2023.
//

import Foundation

enum NetworkError: LocalizedError {
    case unreachableAddress(url: String)
    case invalidResponse
    case decodingError(type: String)
    
    var errorDescription: String? {
        switch self {
        case .unreachableAddress(let url):
            return"\(url) is unreachable"
        case .decodingError(let type):
            return "\(type) Decoding error"
        case .invalidResponse:
            return "Response with mistake" }
    }
}
