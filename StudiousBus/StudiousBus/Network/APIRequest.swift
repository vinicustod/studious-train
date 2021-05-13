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
    var method: RequestMethod { get set }
    var path: String { get }
    var queryItems: [String: String] { get }

    func getRequest(with baseURL: URL) -> URLRequest
}

extension APIRequest {
    func getRequest(with baseURL: URL) -> URLRequest {
        guard var components = URLComponents(url: baseURL.appendingPathComponent(path),
                                             resolvingAgainstBaseURL: false) else {
            fatalError("Unable to create URL components")
        }

        let items = self.queryItems.map { (key, value) -> URLQueryItem in
            URLQueryItem(name: key, value: value)
        }
        components.queryItems = items
        
        let apiKey = URLQueryItem(name: "apiKey", value: "3kVa1lON7buNp_cIyHooGsmRTy73rwhiB3XQAr6dNDg")
        components.queryItems?.append(apiKey)

        guard let url = components.url else {
            fatalError("Could not get url")
        }


        var request = URLRequest(url: url)
        request.httpMethod = self.method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        return request
    }
}
