//
//  APIEndpoint.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2/23/24.
//

import Foundation

import Moya

enum BasterdzDomain {
    case room
    case report
}

extension BasterdzDomain {
    
    // 도메인에 따른 기본 url
    var url: String {
        switch self {
        case .room:
            return "/v1/rooms"
        case .report:
            return "v1/reports"
        }
    }
}

/*
APIEndpoint가 기본적으로 준수해야 하는 정보

domain: BasterdzDomain(ex. room, report ...)
path: Domain 뒤에 붙는 상세 경로
error: 상태코드에 따른 NetworkError 구분하는데 사용되는 딕셔너리
parameters : Request에 사용될 Paramter - 기본적으로 JSONEncoding 방식으로 인코딩
 */
protocol APIEndpoint: TargetType {
    var domain: BasterdzDomain { get }
    var path: String { get }
    var error: [Int: NetworkError]? { get }
    var parameters: [String: Any]? { get }
}

extension APIEndpoint {
    
    var baseURL: URL {
        return URL(string: NetworkEnvironment.baseURL)!
    }
    
    var path: String {
        return domain.url + path
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
    
    var headers: [String: String]? {
        switch self {
        default:
            return NetworkEnvironment.HTTPHeaderFields.default
        }
    }
    
    var task: Task {
        if let parameters = parameters {
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        }
        return .requestPlain
    }
}
