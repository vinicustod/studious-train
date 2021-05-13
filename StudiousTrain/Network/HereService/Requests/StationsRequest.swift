//
//  StationsRequest.swift
//  StudiousTrain
//
//  Created by vinicius.custodio on 04/04/21.
//

import Foundation

class StationsRequest: HereRequest {
    var object: Encodable?
    var method: RequestMethod = .GET
    var path: String = "/station"

    init(object: Encodable?) {
        self.object = object
    }

}
