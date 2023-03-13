//
//  NetworkServices.swift
//  SpaceX
//
//  Created by Алексей Ходаков on 28.02.2023.
//

import Foundation
import Combine
import UIKit

protocol NetworkServiceProtocol {
    func rocketsLoader() -> AnyPublisher<Rockets, NetworkError>
    func launchesLoader() -> AnyPublisher<Launches, NetworkError>
    func imageLoader(url: URL) -> AnyPublisher<UIImage?, Never>
}

class NetworkService: NetworkServiceProtocol {
    
    // MARK: - Private properties
    private let decoder = JSONDecoder()
    private let queue = DispatchQueue(label: "NetworkService", qos: .default, attributes: .concurrent)
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Public functions
    func rocketsLoader() -> AnyPublisher<Rockets, NetworkError>  {
        URLSession.shared
            .publisher(for: URL(string: "https://api.spacexdata.com/v4/rockets")!)
    }
    
    func launchesLoader() -> AnyPublisher<Launches, NetworkError> {
        URLSession.shared
            .publisher(for: URL(string: "https://api.spacexdata.com/v4/launches")!)
    }
    
    func imageLoader(url: URL) -> AnyPublisher<UIImage?, Never> {
        URLSession.shared
            .dataTaskPublisher(for: url)
            .map { data, _ in UIImage(data: data) }
            .replaceError(with: nil)
            .eraseToAnyPublisher()
    }
}
