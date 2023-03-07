//
//  LaunchCell.swift
//  SpaceX
//
//  Created by Алексей Ходаков on 05.03.2023.
//

import SwiftUI

struct LaunchCell: View {
    
    let name: String
    let date: String
    let successes: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(name)
                    .font(.system(size: 20))
                Text(date)
                    .font(.system(size: 16))
                    .opacity(0.5)
            }
            Spacer()
            
            Image(successes ? "SuccessfulLaunch" : "FailedLaunch")
        }
        .padding(25)
        .background(.gray.opacity(0.2))
        .cornerRadius(20)
        .padding(.horizontal, 30)
    }
}
