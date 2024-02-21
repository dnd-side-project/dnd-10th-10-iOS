//
//  RoomNetwork.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/21/24.
//

import Foundation
import Moya

enum RoomNetwork {
    case createRoom(member: MemberEntity, room: RoomEntity)
    
    // detail
    case pendingRoomDetail(id: String)
    case progressRoomDetail(id: String)
    
}

extension RoomNetwork: TargetType {
    var baseURL: URL {
        let urlString = "https://baster-dz.com"
        guard let url = URL(string: urlString) else {fatalError("유효하지 않은 url")}
        return url
    }
    
    var path: String {
        switch self {
        case .createRoom:
            "/v1/rooms"
        case .pendingRoomDetail(let id):
            "v1/rooms/\(id)/members"
        case .progressRoomDetail(let id):
            "v1/rooms/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .createRoom:
                .post
        case .pendingRoomDetail:
                .get
        case .progressRoomDetail:
                .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .createRoom(let member, let room):
            let parameters: [String: Any] = [
                "member": member,
                "roomCreateRequestDto": room
            ]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        case .pendingRoomDetail:
            return .requestPlain
        case .progressRoomDetail:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self.method {
        case .post:
            return ["Content-Type": "application/json"]
        default:
            return .none
        }
    }
}
