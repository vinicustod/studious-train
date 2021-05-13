//
//  StationsRequest.swift
//  StudiousTrain
//
//  Created by vinicius.custodio on 04/04/21.
//

import Foundation
import CoreLocation

class StationsRequest: APIRequest {
    var queryItems: [String : String]
    var method: RequestMethod = .GET
    var path: String = "/stations"

    init(location: CLLocationCoordinate2D) {
        queryItems = ["in": "\(location.latitude),\(location.longitude)"]
    }
}
