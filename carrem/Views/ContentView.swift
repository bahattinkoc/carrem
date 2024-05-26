//
//  ContentView.swift
//  carrem
//
//  Created by BAHATTIN KOC on 21.05.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CameraViewModel()

    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    VStack {
                        Text("Take a photo of your parking space...")
                            .bold()
                            .font(.title2)
                            .padding()

                        ScannerView(viewModel: viewModel)
                            .cornerRadius(24.0)
                            .padding()

                        Spacer()

                        CameraButton {
                            viewModel.takePhoto()
                        }
                        .padding()
                    }

                    ErrorView(error: .none)
                }
            }
            .navigationDestination(isPresented: $viewModel.showPhotoDetailView) {
                OCRListView(wordList: viewModel.wordList ?? [])
            }
            .onAppear() {
                viewModel.startRunning()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
