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
    @State private var isAnimating = false

    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ZStack {
                    VStack {
                        Spacer()
                        ZStack {
                            Circle()
                                .foregroundStyle(.green)
                                .frame(width: isAnimating ? 260 : 240, height: isAnimating ? 260 : 240)
                                .opacity(0.7)
                                .onAppear {
                                    withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                                        isAnimating = true
                                    }
                                }
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
                        }
                        .frame(width: geometry.size.width, height: 260)
                        if !parkHistoryList.isEmpty || true {
                            Button(action: {
                                showParkHistoryView = true
                            }) {
                                Image(uiImage: UIImage(named: "history")!)
                                    .resizable()
                                    .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                                    .aspectRatio(contentMode: .fit)
                                    .tint(.white)
                                    .frame(width: 60, height: 60)
                                    .background(Color.orange)
                                    .cornerRadius(20.0)
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
