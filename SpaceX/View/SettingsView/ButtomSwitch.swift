//
//  SwiftUIView.swift
//  SpaceX
//
//  Created by Алексей Ходаков on 05.03.2023.
//

import SwiftUI

struct ButtomSwitch: View {
    
    let label: SettingsKeys
    let switchableParameter: Bool
    let units: [String]
    
    @EnvironmentObject var settings: SettingsViewModel
    
    var body: some View {
        HStack {
            Text(label.rawValue)
            Spacer()
            
            Button(action: {
                withAnimation {
                    if switchableParameter {
                        settings.setSetupKey(valee: false, key: label)
                    } else {
                        settings.setSetupKey(valee: true, key: label)
                    }
                }
            }, label: {
                ZStack(alignment: switchableParameter ? .leading : .trailing) {
                    HStack {
                        Text(units[0])
                        
                        Spacer()
                        
                        Text(units[1])
                    }
                    .padding(.horizontal, 20)
                    .foregroundColor(.gray)
                    
                    Text(switchableParameter ? units[0] : units[1])
                        .foregroundColor(.black)
                        .frame(width: 56, height: 34)
                        .background(.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 3)
                }
            })
            .frame(width: 115, height: 40)
            .background(.white.opacity(0.1))
            .cornerRadius(10)
        }
        .padding(.vertical, 5)
    }
}
