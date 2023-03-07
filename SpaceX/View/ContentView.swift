//
//  ContentView.swift
//  SpaceX
//
//  Created by Алексей Ходаков on 28.02.2023.
//

import SwiftUI

struct ContentView: View {

    @State var isPresent = false
    @State var fakeIndex = 0
    @State var offset: CGFloat = 0
    
    @StateObject var viewModel = ContentViewModel()
    @StateObject var settings = SettingsViewModel()

    var body: some View {
        NavigationView {
            GeometryReader {
                let safeArea = $0.safeAreaInsets
                let size = $0.size
                if viewModel.isLoaded {
                    ScrollView(.init()) {
                        TabView(selection: $fakeIndex) {
                            ForEach(0..<viewModel.rockets.count, id: \.self) { index in
                                RocketView(launchs: viewModel.launchs,
                                           rocket: viewModel.rockets[index],
                                           safeArea: safeArea,
                                           size: size)
                                .environmentObject(settings)
                                .offsetX { value in
                                    if fakeIndex == index {
                                        withAnimation {
                                            offset = value + (size.width * CGFloat(index))
                                        }
                                    }
                                }
                                .tag(index)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                        .overlay(
                            CustomBlurView(effect: .dark)
                                .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                                .frame(height: 80)
                                .overlay(content: {
                                    HStack(spacing: 15) {
                                        ForEach(0..<viewModel.rockets.count, id: \.self) { index in
                                            Capsule()
                                                .fill(.white)
                                                .frame(width: viewModel.getIngex(offset: offset, width: getRect().width) == index ? 20 : 7, height: 7)
                                            
                                        }
                                    }
                                })
                            , alignment: .bottom)
                    }
                    .preferredColorScheme(.dark)
                    .ignoresSafeArea()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
