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
        ZStack {
            FrameView(image: model.frame)
                .frame(width: 200, height: 200)
                .cornerRadius(20.0)
            
            ErrorView(error: model.error)
            
            ControlView(
                comicSelected: $model.comicFilter,
                monoSelected: $model.monoFilter,
                crystalSelected: $model.crystalFilter)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
