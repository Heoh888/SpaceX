//
//  RocketParametersCell.swift
//  SpaceX
//
//  Created by Алексей Ходаков on 05.03.2023.
//

import SwiftUI

struct RocketParametersCell: View {
    
    let value: String
    let label: String
    
    var body: some View {
        VStack {
            Text(value)
                .fontWeight(.bold)
                .font(.system(size: 16))
            
            Text(label)
                .font(.system(size: 14))
                .opacity(0.5)
                .offset(y: 5)
        }
        .frame(width: 96, height: 96)
        .background(.gray.opacity(0.2))
        .cornerRadius(25)
    }
}
