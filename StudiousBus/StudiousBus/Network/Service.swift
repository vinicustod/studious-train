//
//  Service.swift
//  StudiousTrain
//
//  Created by vinicius.custodio on 02/04/21.
//

import Foundation

protocol ServiceInterface: AnyObject {
    typealias ResultCallback<Model> = (Result<Model, Error>) -> Void

    var baseURL: URL { get }
    func send<Model:Decodable>(apiRequest: APIRequest,
                               callback: @escaping ResultCallback<Model>) -> URLSessionDataTask
}
