//
//  CommonResponse.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2/23/24.
//

import Foundation

struct CommonResponse<T: Decodable>: Decodable {
    let success: Bool
    let data: T?
    let error: ErrorResponse?
    
    enum CodingKeys: CodingKey {
        case success
        case data
        case error
    }
}
