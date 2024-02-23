//
//  RoomAPI.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2/23/24.
//

import Foundation

import Moya

enum RoomAPI {
    case createRoom(room: RoomEntity)
    case getRoomUsingCode(code: String)
    case searchRoom
    case pendingRoomDetail(id: String)
    case progressRoomDetail(id: String)
}

extension RoomAPI: BaseAPI {
    
    var domain: BasterdzDomain {
        return .room
    }
    
    var method: Moya.Method {
        switch self {
        case .createRoom:
            return .post
        case .getRoomUsingCode:
            return .get
        case .searchRoom:
            return .get
        case .pendingRoomDetail:
            return .get
        case .progressRoomDetail:
            return .get
        }
    }
    
    var urlPath: String {
        switch self {
        case .createRoom:
            ""
        case .getRoomUsingCode(let code):
            "?inviteCode=\(code)"
        case .pendingRoomDetail(let id):
            "\(id)/members"
        case .progressRoomDetail(let id):
            "\(id)"
        case .searchRoom:
            ""
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .createRoom(let room):
            return [
                "title": room.name,
                "goal": room.goal,
                "personnel": room.maxPeople,
                "restrictApp": room.restrictAppType.toDictionaryString,
                "startDate": room.period,
                "endDate": room.period,
                "limitHour": room.restrictAppTime
            ]
        case .getRoomUsingCode:
            return .none
        case .searchRoom:
            return .none
        case .pendingRoomDetail:
            return .none
        case .progressRoomDetail:
            return .none
        }
    }
    
    var error: [Int: NetworkError]? {
        return nil
    }
}
