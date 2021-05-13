//
//  HereService.swift
//  StudiousTrain
//
//  Created by vinicius.custodio on 02/04/21.
//

import URLQueryItemEncoder

extension ServiceInterface {
    func send<Model: Decodable>(apiRequest: APIRequest, callback: @escaping (Result<Model, Error>) -> Void) -> URLSessionDataTask {
        let request = apiRequest.getRequest(with: self.baseURL)

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data,
               let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode == 200 {
                do {
                    let decoder = JSONDecoder()

                    let model: Model = try decoder.decode(Model.self, from: data)
                    DispatchQueue.main.async {
                        callback(.success(model))
                    }

                } catch {
                    DispatchQueue.main.async {
//                        callback(.failure(GithubAPIError.decodingError))
                    }
                }
            } else {
                DispatchQueue.main.async {
//                    callback(.failure(GithubAPIError.requestError))
                }
            }

        }

        task.resume()

        return task
    }
}

class HereService: ServiceInterface {
    let baseURL: URL = URL(string: "https://transit.router.hereapi.com/v8")!
}

class HereRequest {
    
}

extension APIRequest where Self: HereRequest {
    func getRequest(with baseURL: URL) -> URLRequest {
        guard var components = URLComponents(url: baseURL.appendingPathComponent(path),
                                             resolvingAgainstBaseURL: false) else {
            fatalError("Unable to create URL components")
        }

        let encoder = URLQueryItemEncoder()
        let apiKey = URLQueryItem(name: "apiKey", value: "3kVa1lON7buNp_cIyHooGsmRTy73rwhiB3XQAr6dNDg")
        components.queryItems = [apiKey]
        if let object = self.object {
            if let items = try? encoder.encode(object) {
                components.queryItems?.append(contentsOf: items)
            }
        }

        guard let url = components.url else {
            fatalError("Could not get url")
        }


        var request = URLRequest(url: url)
        request.httpMethod = self.method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        return request
    }
}
