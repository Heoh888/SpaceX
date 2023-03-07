//
//  LaunchsView.swift
//  SpaceX
//
//  Created by Алексей Ходаков on 28.02.2023.
//

import SwiftUI

struct LaunchsView: View {
    
    let launchs: Launches
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - NavigationBar
    var buttomBack : some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.backward")
                .scaleEffect(0.8)
                .foregroundColor(.white)
        }
        .padding(.leading, 25)
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                ForEach(launchs.reversed()) { launch in
                    LaunchCell(name: launch.name,
                               date: launch.dateUnix.dateFormatted(withFormat: "MM-dd-yyyy HH:mm"),
                               successes: launch.success ?? false)
                }
            }
        }
        .padding(.top, 25)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: buttomBack)
    }
}
