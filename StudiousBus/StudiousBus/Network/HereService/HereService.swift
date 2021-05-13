//
//  HereService.swift
//  StudiousTrain
//
//  Created by vinicius.custodio on 02/04/21.
//

import URLQueryItemEncoder

class HereService: ServiceInterface {
    let baseURL: URL = URL(string: "https://transit.router.hereapi.com/v8")!
}

extension ServiceInterface {
    @discardableResult
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
                    print(error)
                    DispatchQueue.main.async {
//                        callback(.failure(GithubAPIError.decodingError))
                    }
                }
            } else {
                print(response, error)
                DispatchQueue.main.async {
//                    callback(.failure(GithubAPIError.requestError))
                }
            }

        }

        task.resume()

        return task
    }
}
