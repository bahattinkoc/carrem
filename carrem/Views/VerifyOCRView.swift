//
//  VerifyOCRView.swift
//  carrem
//
//  Created by BAHATTIN KOC on 26.05.2024.
//

import SwiftUI
import WidgetKit

struct VerifyOCRView: View {
    @AppStorage("activeParkAreaCode", store: UserDefaults(suiteName: "group.carrem"))
    var parkAreaCode: String = ""

    @State private var text: String = ""
    @State private var shouldNavigate: Bool = false


    init(ocrText: String) {
        _text = State(initialValue: ocrText)
    }

    var body: some View {
        VStack(alignment: .center) {
            Text("Verift Park Area Code")
                .bold()
                .padding()

            Spacer()

            TextEditor(text: $text)
                .bold()
                .font(.system(size: 80.0))
                .frame(minHeight: 100.0)
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
                shouldNavigate = true
                // TODO: - son kayıt noktasını kaydet state'i aktif yap.
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
        }
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
