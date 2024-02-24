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
    case getRank(id: String, date: String)
    case getScreenTime(id: String, date: String)
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
        case .getRank:
            return .get
        case .getScreenTime:
            return .get
        }
    }
    
    var urlPath: String {
        switch self {
        case .createRoom:
            ""
        case .getRoomUsingCode:
            ""
        case .pendingRoomDetail(let id):
            "\(id)/members"
        case .searchRoom:
            ""
        case .progressRoomDetail(let id):
            "/\(id)"
        case .getRank(id: let id, date: _):
            "/\(id)/rank"
        case .getScreenTime(id: let id, date: _):
            "/\(id)/screen-time"
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
                "limitHour": room.restrictAppTime,
                "targetDay": room.period
            ]
        case .getRoomUsingCode(let code):
            return [
                "inviteCode": code
            ]
        case .searchRoom:
            return .none
        case .pendingRoomDetail:
            return .none
        case .progressRoomDetail:
            return .none
        case .getRank(id: _, date: let date):
            return [
                "date": date
            ]
        case .getScreenTime:
            return .none
        }
    }
    
    var error: [Int: NetworkError]? {
        return nil
    }
}
