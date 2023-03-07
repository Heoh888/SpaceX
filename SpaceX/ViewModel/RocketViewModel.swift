//
//  RocketViewModel.swift
//  SpaceX
//
//  Created by Алексей Ходаков on 02.03.2023.
//

import Foundation
import Combine
import UIKit

final class RocketViewModel: ObservableObject {
    
    // MARK: - Public properties
    @Published var image: UIImage?
    
    // MARK: - Private properties
    private let service: NetworkServiceProtocol!
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Initialisation
    init(service: NetworkServiceProtocol = NetworkService()) {
        self.service = service
    }
    
    // MARK: - Public functions
    func getImage(from: String) {
        guard let url = URL(string: from) else { return }
        service.imageLoader(url: url)
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { self.image = $0 })
            .store(in: &cancellables)
    }
    
    func unitFormatter(rocket: RocketModel, value: Bool, key: SettingsKeys) -> String {
        switch key {
        case .height: return value ? "\(rocket.height.feet ?? 0)" : "\(rocket.height.meters ?? 0)"
        case .diameter: return value ? "\(rocket.diameter.feet ?? 0)" : "\(rocket.diameter.meters ?? 0)"
        case .weight: return value ? "\(rocket.mass.lb)" : "\(rocket.mass.kg)"
        case .payload: return value ? "\(rocket.payloadWeights[0].lb)" : "\(rocket.payloadWeights[0].kg)"
        }
    }
}
