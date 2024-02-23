//
//  NetworkProvider.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2/23/24.
//

import Foundation

import Combine
import CombineMoya
import Moya

protocol Requestable {
    associatedtype API: BaseAPI
    
    func request(_ endpoint: API) -> AnyPublisher<Response, MoyaError>
}

extension Requestable {
    func request(_ endpoint: API) -> AnyPublisher<Response, MoyaError> {
        self.request(endpoint)
    }
}

final class NetworkProvider<API: BaseAPI>: Requestable {
    
    private let provider: MoyaProvider<API>
    
    init(plugins: [PluginType] = []) {
        let session = MoyaProvider<API>.defaultAlamofireSession()
        session.sessionConfiguration.timeoutIntervalForRequest = 30
        
        self.provider = MoyaProvider(session: session, plugins: plugins)
    }
    
    func request(_ api: API) -> AnyPublisher<Response, MoyaError> {
        return provider.requestPublisher(api)
            .filterSuccessfulStatusCodes()
    }
}
