//
//  VerifyOCRView.swift
//  carrem
//
//  Created by BAHATTIN KOC on 26.05.2024.
//

import SwiftUI
import WidgetKit
import CoreLocation

struct VerifyOCRView: View {
    @AppStorage("activeParkAreaCode", store: UserDefaults(suiteName: "group.carrem"))
    var parkAreaCode: String = ""
    @AppStorage("activeParkPhoto", store: UserDefaults(suiteName: "group.carrem"))
    var capturedData: Data?

    @Environment(\.modelContext) var modelContext

    @ObservedObject var locationManager = LocationManager()

    @State private var text: String = ""
    @State private var shouldNavigate: Bool = false

    init(ocrText: String) {
        _text = State(initialValue: ocrText)
    }

    var body: some View {
        VStack(alignment: .center) {
            Spacer()

            TextEditor(text: $text)
                .bold()
                .font(.system(size: 80.0))
                .frame(minHeight: 200.0)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
                .toolbar {
                    ToolbarItem(placement: .keyboard) {
                        HStack {
                            Spacer()
                            Button("Done") {
                                UIApplication.shared.endEditing()
                            }
                        }
                    }
                }
                .padding()

            Spacer()

            Button(action: {
                parkAreaCode = text
                WidgetCenter.shared.reloadAllTimelines()
                addPark()
                shouldNavigate = true
            }) {
                Text("Onayla")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
            .navigationDestination(isPresented: $shouldNavigate) {
                StopView().navigationBarBackButtonHidden()
            }
            .navigationTitle("Verify Park Area Code")
        }
    }

    func addPark() {
        modelContext.insert(
            ParkModel(
                code: parkAreaCode,
                latitude: locationManager.location?.coordinate.latitude,
                longitude: locationManager.location?.coordinate.longitude,
                image: capturedData,
                date: Date().formattedDate(),
                time: Date().formattedTime(),
                isParking: true
            )
        )
    }
}

#Preview {
    VerifyOCRView(ocrText: "C16")
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
