//
//  MainView.swift
//  carrem
//
//  Created by BAHATTIN KOC on 30.05.2024.
//

import SwiftUI

struct MainView: View {
    @State private var showCameraView: Bool = false
    @State private var showParkHistoryView: Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            showParkHistoryView = true
                        }) {
                            Image(systemName: "clock.arrow.circlepath")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .tint(.gray)
                                .padding()
                        }
                    }
                    Spacer()
                }
                VStack {
                    Spacer()
                    Button(action: {
                        showCameraView = true
                    }) {
                        Image(systemName: "car.fill")
//                            .font(.largeTitle)
                            .resizable()
                            .padding(EdgeInsets(top: 70, leading: 70, bottom: 70, trailing: 70))
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .frame(width: 200, height: 200)
                            .background(Color.green)
                            .cornerRadius(100)
                            .shadow(radius: 10)
                    }
                    Spacer()
                }
            }
            .navigationDestination(isPresented: $showCameraView) {
                CameraView().navigationBarBackButtonHidden()
            }
            .navigationDestination(isPresented: $showParkHistoryView) {
                ParkHistoryListView()
            }
        }
    }
}

#Preview {
    MainView()
}
