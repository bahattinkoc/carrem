//
//  MainView.swift
//  carrem
//
//  Created by BAHATTIN KOC on 30.05.2024.
//

import SwiftUI
import SwiftData
import WebKit

struct MainView: View {
    @Query private var parkHistoryList: [ParkModel]
    @State private var showCameraView = false
    @State private var showParkHistoryView = false
    @State private var isShowingPrivacyPolicy = false
    @State private var isShowingTermsOfConditions = false

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Spacer()
                    Button(action: {
                        showCameraView = true
                    }) {
                        Image(systemName: "car.fill")
                            .resizable()
                            .padding(EdgeInsets(top: 70, leading: 70, bottom: 70, trailing: 70))
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .frame(width: 200, height: 200)
                            .background(Color.green)
                            .cornerRadius(100)
                            .shadow(radius: 10)
                    }
                    if !parkHistoryList.isEmpty {
                        Button(action: {
                            showParkHistoryView = true
                        }) {
                            Image(systemName: "clock.arrow.circlepath")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .tint(.gray)
                                .padding()
                        }
                    }
                    Spacer()
                    HStack {
                        Button(action: {
                            isShowingPrivacyPolicy = true
                        }) {
                            Text(LocalizationContants.MainView.privacyPolicy)
                                .foregroundStyle(.gray)
                                .font(.footnote)
                        }
                        .sheet(isPresented: $isShowingPrivacyPolicy) {
                            WebViewContainer(urlString: "https://sites.google.com/view/carrem/privacy-policy")
                        }
                        Text("•")
                            .foregroundStyle(.gray)
                            .font(.footnote)
                        Button(action: {
                            isShowingTermsOfConditions = true
                        }) {
                            Text(LocalizationContants.MainView.termsOfConditions)
                                .foregroundStyle(.gray)
                                .font(.footnote)
                        }
                        .sheet(isPresented: $isShowingTermsOfConditions) {
                            WebViewContainer(urlString: "https://sites.google.com/view/carrem/terms-of-conditions")
                        }
                    }
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

struct WebViewContainer: UIViewRepresentable {
    let urlString: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}
