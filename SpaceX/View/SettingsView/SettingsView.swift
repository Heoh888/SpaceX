//
//  SettingsView.swift
//  SpaceX
//
//  Created by Алексей Ходаков on 28.02.2023.
//

import SwiftUI

struct SettingsView: View {

    @EnvironmentObject var settings: SettingsViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Text("Настройки")
                }
                
                Button(action: { presentationMode.wrappedValue.dismiss() }, label: {
                    Text("Закрыть")
                        .foregroundColor(. white)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                })
            }
            .padding(.top, 25)
            .padding(.bottom, 50)
            
            VStack {
                ButtomSwitch(label: .height, switchableParameter: settings.height, units: ["ft", "m"])
                ButtomSwitch(label: .diameter, switchableParameter: settings.diameter, units: ["ft", "m"])
                ButtomSwitch(label: .weight, switchableParameter: settings.weight, units: ["ld", "kg"])
                ButtomSwitch(label: .payload, switchableParameter: settings.payload, units: ["ft", "m"])
                ButtomSwitch(label: .randomImage, switchableParameter: settings.randomImage, units: ["Yes", "No"])
            }
            .environmentObject(settings)
            Spacer()
        }
        .padding(.horizontal, 25)
    }
}
