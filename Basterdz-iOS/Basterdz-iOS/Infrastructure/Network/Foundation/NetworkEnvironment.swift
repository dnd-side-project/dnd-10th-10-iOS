//
//  NetworkEnvironment.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2/23/24.
//

import Foundation

enum NetworkEnvironment {
    static let baseURL = "https://baster-dz.com"
}

extension NetworkEnvironment {
    
    enum HTTPHeaderFields {
        static let `default`: [String: String] = [
            "Content-Type": "application/json",
            "Authorization": "eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJiYXN0ZXJkeiIsImlhdCI6MTcwODcxMTY3MywiZXhwIjoxNzA5NzEyOTgxLCJtZW1iZXJJZCI6MX0.DGPFDD3as56wXdVNrdHC7hayrvLBJdHKbWbvmhCH1hI"
        ]
    }
}
