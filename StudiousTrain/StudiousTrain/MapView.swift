//
//  MapView.swift
//  StudiousTrain
//
//  Created by vinicius.custodio on 04/04/21.
//

import SwiftUI
import MapKit

struct Location : Identifiable {
  let id = UUID()
  let title: String
  let coordinate: CLLocationCoordinate2D
}

extension Location {
  static func getLocations() -> [Location] {
    return [
      Location(title: "Breda", coordinate:
         CLLocationCoordinate2D(latitude: 51.58, longitude: 4.77)),
      Location(title: "Tilburg", coordinate:
         CLLocationCoordinate2D(latitude: 51.55, longitude: 5.05 ))
    ]
  }
}

struct MapView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.58, longitude: 4.77), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

    @State private var locations = Location.getLocations()

    var body: some View {
        Map()
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
