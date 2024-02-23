//
//  NetworkEnvironment.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2/23/24.
//

import Foundation

enum NetworkEnvironment {
    static let baseURL = "http://13.209.101.164:8080"
}

extension NetworkEnvironment {
    
    // TODO: accessToken 교체 필요
    enum HTTPHeaderFields {
        static let `default`: [String: String] = [
            "Content-Type": "application/json",
            "accessToken": ""
        ]
    }
}
