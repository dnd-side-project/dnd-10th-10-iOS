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
    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.success = (try? container.decode(Bool.self, forKey: .success)) ?? false
//        self.data = try container.decodeIfPresent(T.self, forKey: .data)
//        self.error = try container.decodeIfPresent(ErrorResponse.self, forKey: .error)
//    }
}
