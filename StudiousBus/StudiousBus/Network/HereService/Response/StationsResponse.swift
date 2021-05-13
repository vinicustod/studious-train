//
//  StationsResponse.swift
//  StudiousBus
//
//  Created by vinicius.custodio on 12/05/21.
//

import Foundation
import CoreLocation

struct StationsResponse: Decodable {
    let stations: [Station]
}

struct Station: Decodable {
    let place: Place
}

struct Place: Decodable {
    let name: String
    let type: String
    let id: String
    let location: Location
}

struct Location: Decodable {
    let lat: Double
    let lng: Double

    var to2DCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: lat, longitude: lng)
    }
}
