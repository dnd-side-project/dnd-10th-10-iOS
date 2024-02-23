//
//  ErrorResponse.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2/23/24.
//

import Foundation

struct ErrorResponse: Decodable {
    let code: String
    let message: String
}

extension ErrorResponse: Error {
    static let commonError = ErrorResponse(code: "500", message: "네트워크 실패")
}

