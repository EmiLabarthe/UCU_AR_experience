//
//  Map.swift
//  Landmarks
//
//  Created by Emiliano Labarthe on 5/12/24.
//

import SwiftUI
import MapKit


struct MapView: View {

    var body: some View {
        Map(initialPosition: .region(region))
    }

    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -34.888737, longitude:  -56.159102),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    }
}


#Preview {
    MapView()
}
