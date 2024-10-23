//
//  ParkHistoryCell.swift
//  carrem
//
//  Created by BAHATTIN KOC on 30.05.2024.
//

import SwiftUI
import MapKit

struct ParkHistoryCell: View {
    var park: ParkModel?
    @State private var isFullScreen = false

    var body: some View {
        HStack {
            Image(uiImage: UIImage(data: (park?.image!)!)!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .cornerRadius(8)
                .clipped()
                .onTapGesture {
                    withAnimation {
                        isFullScreen = true
                    }
                }

            VStack(alignment: .leading) {
                Text(park?.code ?? "")
                Text("\(park?.date ?? "") - \(park?.time ?? "")")
                    .foregroundColor(.gray)
            }
            .padding(.leading, 10)

            Spacer()

            Image(systemName: "location.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
                .foregroundColor(.gray)
                .onTapGesture {
                    openMapsWithCoordinates(
                        latitude: park?.latitude ?? 0.0,
                        longitude: park?.longitude ?? 0.0
                    )
                }
        }
        .padding(.vertical, 5)
        .fullScreenCover(isPresented: $isFullScreen) {
            FullScreenPhotoView(fullScreenImageData: (park?.image!)!)
        }
    }

    func openMapsWithCoordinates(latitude: Double, longitude: Double) {
        let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.openInMaps(launchOptions: nil)
    }
}

#Preview {
    ParkHistoryCell()
}
