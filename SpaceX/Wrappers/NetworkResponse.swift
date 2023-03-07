//
//  NetworkResponse.swift
//  SpaceX
//
//  Created by Алексей Ходаков on 05.03.2023.
//

import Foundation

@propertyWrapper public struct NetworkResponse<T: Decodable>: Decodable {

    // MARK: - Public properties
    public let wrappedValue: T?
    
    // MARK: - Initialisation
    public init(from decoder: Decoder) throws {
        wrappedValue = try? T(from: decoder)
    }
    
    public init(_ wrappedValue: T?) {
        self.wrappedValue = wrappedValue
    }
}
