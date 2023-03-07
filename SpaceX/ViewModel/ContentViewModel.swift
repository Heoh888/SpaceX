//
//  RocketViewModel.swift
//  SpaceX
//
//  Created by Алексей Ходаков on 28.02.2023.
//

import Foundation
import Combine

final class ContentViewModel: ObservableObject {
    
    // MARK: - Public properties
    @Published var rockets = Rockets()
    @Published var launchs = Launches()
    @Published var isLoaded: Bool = false
    
    // MARK: - Private properties
    private let service: NetworkServiceProtocol!
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Initialisation
    init(service: NetworkServiceProtocol = NetworkService()) {
        self.service = service
        getRockets()
        getLaunches()
    }
     
    // MARK: - Private functions
    private func getRockets() {
        service.rocketsLoader()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { print($0) },
                  receiveValue: {
                self.rockets = $0
                self.isLoaded = true
            })
            .store(in: &cancellables)
    }
    
    private func getLaunches() {
        service.launchesLoader()
             .receive(on: DispatchQueue.main)
             .sink(receiveCompletion: { print($0) },
                   receiveValue: { self.launchs = $0 })
             .store(in: &cancellables)
     }
}

// MARK: - Extension ContentViewModel
extension ContentViewModel {
    func getIngex(offset: CGFloat, width: CGFloat) -> Int {
        Int(round(Double(offset / width)))
    }
}
