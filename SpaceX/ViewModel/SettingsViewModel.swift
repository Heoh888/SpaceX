//
//  SettingsViewModel.swift
//  SpaceX
//
//  Created by Алексей Ходаков on 28.02.2023.
//

import Foundation

enum SettingsKeys : String {
    case height = "Высота"
    case diameter = "Диаметр"
    case weight = "Масса"
    case payload = "Полезная нагрузка"
    case randomImage = "Рандомное изображение"
}

final class SettingsViewModel: ObservableObject {
    
    // MARK: - Public properties
    @Published var height = UserDefaults().getSetupKey(key: .height)
    @Published var diameter = UserDefaults().getSetupKey(key: .diameter)
    @Published var weight = UserDefaults().getSetupKey(key: .weight)
    @Published var payload = UserDefaults().getSetupKey(key: .payload)
    @Published var randomImage = UserDefaults().getSetupKey(key: .randomImage)
    
    // MARK: - Public functions
    func setSetupKey(valee: Bool, key: SettingsKeys) {
        UserDefaults.standard.set(valee, forKey: key.rawValue)
        switch key {
        case .height:
            height = UserDefaults().getSetupKey(key: .height)
        case .diameter:
            diameter = UserDefaults().getSetupKey(key: .diameter)
        case .weight:
            weight = UserDefaults().getSetupKey(key: .weight)
        case .payload:
            payload = UserDefaults().getSetupKey(key: .payload)
        case .randomImage:
            randomImage = UserDefaults().getSetupKey(key: .randomImage)
        }
    }
}
