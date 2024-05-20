//
//  ContentView.swift
//  carrem
//
//  Created by BAHATTIN KOC on 21.05.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var model = ContentViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    Text("Scanning...")
                        .bold()
                        .padding()
                    FrameView(image: model.frame)
                        .frame(width: geometry.size.width - 48.0,
                               height: geometry.size.height * 0.7,
                               alignment: .top)
                        .cornerRadius(20.0)
                        .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
                    Spacer()
                }

                ErrorView(error: model.error)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
