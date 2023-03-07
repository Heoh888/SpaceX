//
//  RocketView.swift
//  SpaceX
//
//  Created by Алексей Ходаков on 28.02.2023.
//

import SwiftUI

struct RocketView: View {
    
    @State var showSettings = false
    @StateObject var viewModel = RocketViewModel()
    @EnvironmentObject var settings: SettingsViewModel
    
    let launchs: Launches
    let rocket: RocketModel
    var safeArea: EdgeInsets
    var size: CGSize
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                imageRocket()
                
                VStack {
                    HStack {
                        Text(rocket.name)
                            .fontWeight(.bold)
                            .font(.title2)
                        Spacer()
                        
                        Button(action: { showSettings.toggle() }, label: {
                            Image(systemName: "gearshape")
                                .font(.title2)
                                .foregroundColor(.white)
                        })
                        .sheet(isPresented: $showSettings) {
                            SettingsView()
                                .environmentObject(settings)
                                .preferredColorScheme(.dark)
                        }
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 30)
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        RocketParametersCell(value: viewModel.unitFormatter(rocket: rocket,value: settings.height, key: .height),
                                             label: "Высота, \(settings.height ? "ft" : "m")")
                        RocketParametersCell(value: viewModel.unitFormatter(rocket: rocket, value: settings.diameter, key: .diameter),
                                             label: "Диаметр, \(settings.diameter ? "ft" : "m")")
                        RocketParametersCell(value: viewModel.unitFormatter(rocket: rocket, value: settings.weight, key: .weight),
                                             label: "Масса, \(settings.weight ? "ld" : "kg")")
                        RocketParametersCell(value: viewModel.unitFormatter(rocket: rocket, value: settings.payload, key: .payload),
                                             label: "Нагрузка, \(settings.payload ? "ld" : "kg")")
                    }
                    .padding(.horizontal, 30)
                }
                .padding(.vertical, 30)
                
                RocketParameters(rocket: rocket)
                
                NavigationLink {
                    LaunchsView(launchs: launchs)
                        .navigationBarTitle(Text("Launchs"))
                } label: {
                    Text("Посмотреть запуски")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(.gray.opacity(0.4))
                        .cornerRadius(10)
                        .padding(.horizontal, 30)
                }
                .padding(.top, 30)
                
            }
            .padding(.bottom, 100)
        }
        .ignoresSafeArea(.container, edges: .vertical)
        .coordinateSpace(name: "SCROLL")
    }

    @ViewBuilder
    func imageRocket() -> some View {
        GeometryReader { proxy in
            let size = proxy.size
            let minY = proxy.frame(in: .named("SCROLL")).midY
            let height = size.height + minY
            
            Image(uiImage: viewModel.image ?? UIImage(named: "rocket")!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: height, alignment: .top)
                .clipped()
                .overlay(alignment: .bottom) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.black)
                            .frame(width: size.width, height: 50)
                            .cornerRadius(25)
                            .offset(y: 30)
                    }
                }
                .offset(y: -minY)
                .onAppear {
                    viewModel.getImage(from: rocket.flickrImages[0])
                }
        }
        .frame(height: 420)
    }
}
