//
//  ErrorResponse.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2/23/24.
//

import Foundation

struct ErrorResponse: Decodable, Error {
    let code: String
    let message: String
    
    static let commonError = ErrorResponse(code: "700", message: "네트워크 실패")
}
