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
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJiYXN0ZXJkeiIsImlhdCI6MTcwODcwMDc3MywiZXhwIjoxNzA5NzAyMDgxLCJtZW1iZXJJZCI6MX0.t6n87vnpL-ghu02IxTS2gPCqK7HY8hTO5pvOCQlJKYM"
        ]
    }
}
