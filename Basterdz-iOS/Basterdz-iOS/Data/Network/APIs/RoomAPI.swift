//
//  RoomAPI.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2/23/24.
//

import Foundation

import Moya

enum RoomAPI {
    case searchRoom
}

extension RoomAPI: BaseAPI {
    
    var domain: BasterdzDomain {
        return .room
    }
    
    var method: Moya.Method {
        switch self {
        case .searchRoom:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .searchRoom:
            return .none
        }
    }
    
    var error: [Int: NetworkError]? {
        switch self {
        case .searchRoom:
            return nil
        }
    }
}
