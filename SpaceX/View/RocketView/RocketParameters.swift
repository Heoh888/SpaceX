//
//  RocketParameters.swift
//  SpaceX
//
//  Created by Алексей Ходаков on 05.03.2023.
//

import SwiftUI

struct RocketParameters: View {
    
    let rocket: RocketModel
    
    var body: some View {
        VStack {
            masterRowParameters(label: "Первый запуск", value: rocket.firstFlight)
            masterRowParameters(label: "Страна", value: rocket.country)
            masterRowParameters(label: "Стоимость запуска", value: "\(rocket.costPerLaunch / 1000000) млн")
            
            textBlock(title: "первая ступень",
                      engines: "\(rocket.firstStage.engines)",
                      amount: "\(rocket.firstStage.fuelAmountTons)",
                      time: rocket.firstStage.burnTimeSEC ?? 0)
            
            textBlock(title: "вторая ступень",
                      engines: "\(rocket.secondStage.engines)",
                      amount: "\(rocket.secondStage.fuelAmountTons)",
                      time: rocket.secondStage.burnTimeSEC ?? 0)
        }
    }
    
    @ViewBuilder
    func masterRowParameters(label: String, value: String) -> some View {
        HStack {
            Text(label)
            Spacer()
            
            Text(value)
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 10)
    }
    
    @ViewBuilder
    func textBlock(title: String, engines: String, amount tons: String, time sec: Int) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .fontWeight(.bold)
                .font(.title3)
            
            rocketParameters(label: "Количество двигателей", value: engines, unit: "")
            rocketParameters(label: "Количество топлива", value: tons, unit: "ton")
            if let secund = sec {
                rocketParameters(label: "Время сгорания", value: "\(secund)", unit: "sec")
            }
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 10)
        .padding(.top)
    }
    
    @ViewBuilder
    func rocketParameters(label: String, value: String, unit: String) -> some View {
        HStack {
            Text(label)
            Spacer()
            
            HStack {
                Text(value)
                    .fontWeight(.bold)
                
                Text(unit)
                    .opacity(0.5)
                    .fontWeight(.bold)
                    .frame(minWidth: 25)
            }
            .frame(width: 100, alignment: .trailing)
        }
        .padding(.vertical, 5)
    }
}
