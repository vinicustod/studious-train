//
//  APIRequest.swift
//  StudiousTrain
//
//  Created by vinicius.custodio on 02/04/21.
//

import URLQueryItemEncoder

enum RequestMethod: String {
    case GET = "GET"
    case POST = "POST"
}

protocol APIRequest {
    var object: Encodable? { get set }
    var method: RequestMethod { get set }
    var path: String { get }

    func getRequest(with baseURL: URL) -> URL
}
