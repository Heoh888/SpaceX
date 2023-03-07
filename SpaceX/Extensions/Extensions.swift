//
//  Extensions.swift
//  SpaceX
//
//  Created by Алексей Ходаков on 28.02.2023.
//

import SwiftUI
import Foundation
import Combine

// MARK: - View
extension View {
    func getRect() -> CGRect { UIScreen.main.bounds }
    
    @ViewBuilder
    func offsetX(complition: @escaping (CGFloat) -> ()) -> some View {
        self.overlay {
            GeometryReader { proxy in
                let minX = proxy.frame(in: .global).minX
                Color.clear
                    .preference(key: OffsetKey.self, value: minX)
                    .onPreferenceChange(OffsetKey.self) { value in
                        complition(value)
                    }
            }
        }
    }
}

//MARK: - PreferenceKey
struct OffsetKey: PreferenceKey {
    static let defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
        
    }
}
//MARK: - UserDefaults
extension UserDefaults {
    func getSetupKey(key: SettingsKeys) -> Bool {
        bool(forKey: key.rawValue)
    }
}

//MARK: - Int
extension Int {
    func dateFormatted(withFormat format : String) -> String{
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
    
}

//MARK: - URLSession
extension URLSession {
    func publisher<T: Decodable>(
        for url: URL,
        responseType: T.Type = T.self,
        decoder: JSONDecoder = .init()
    ) -> AnyPublisher<T, NetworkError> {
        dataTaskPublisher(for: url)
            .receive(on: DispatchQueue(label: "NetworkService", qos: .default, attributes: .concurrent))
            .map(\.data)
            .decode(type: NetworkResponse<T>.self, decoder: decoder)
            .mapError({ error -> NetworkError in
                switch error  {
                case is URLError:
                    return NetworkError.unreachableAddress(url: url.description)
                case is DecodingError:
                    return NetworkError.decodingError(type: String(describing: responseType))
                default:
                    return NetworkError.invalidResponse
                }
            })
            .map(\.wrappedValue!)
            .eraseToAnyPublisher()
    }
}
