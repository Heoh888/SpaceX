//
//  CustomBlurView.swift
//  SpaceX
//
//  Created by Алексей Ходаков on 01.03.2023.
//

import SwiftUI

struct CustomBlurView: UIViewRepresentable {
    
    // MARK: - Public properties
    var effect: UIBlurEffect.Style
    
    // MARK: - Public functions
    func makeUIView(context: Context) -> some UIVisualEffectView {
        UIVisualEffectView(effect: UIBlurEffect(style: effect))
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}
