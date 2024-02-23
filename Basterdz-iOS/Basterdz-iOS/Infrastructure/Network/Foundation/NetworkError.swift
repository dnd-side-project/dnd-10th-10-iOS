//
//  NetworkError.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2/23/24.
//

import Foundation

/// Basterdz 네트워크 통신에서 공통적으로 발생하는 에러
enum NetworkError: Int {
    case invalidRequest = 400   // Bad Request (Client Error)
    case unauthorized   = 401   // 로그인 토큰이 없거나 유효하지 않은 경우
    case notFound       = 404   // 유효한 데이터가 없는 경우
    case invalidRoom    = 420   // 이미 시작된 방일 경우
    case duplicated     = 421   // 이미 입장한 회원일 경우
    case serverError    = 500   // Internal Server Error
}
