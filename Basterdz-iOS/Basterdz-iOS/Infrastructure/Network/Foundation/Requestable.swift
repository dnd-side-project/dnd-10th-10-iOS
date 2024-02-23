//
//  Requestable.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2/23/24.
//

import Foundation

import Combine
import CombineMoya
import Moya

protocol Requestable {
    associatedtype Endpoint: APIEndpoint
    
    func request(_ endpoint: Endpoint) -> AnyPublisher<Response, MoyaError>
}

extension Requestable {
    func request(_ endpoint: Endpoint) -> AnyPublisher<Response, MoyaError> {
        self.request(endpoint)
    }
}

final class NetworkProvider<Endpoint: APIEndpoint>: Requestable {
    
    private let provider: MoyaProvider<Endpoint>
    
    init(plugins: [PluginType] = []) {
        let session = MoyaProvider<Endpoint>.defaultAlamofireSession()
        session.sessionConfiguration.timeoutIntervalForRequest = 30
        
        self.provider = MoyaProvider(session: session, plugins: plugins)
    }
    
    func request(_ endpoint: Endpoint) -> AnyPublisher<Response, MoyaError> {
        return provider.requestPublisher(endpoint)
            .filterSuccessfulStatusCodes()
    }
}
