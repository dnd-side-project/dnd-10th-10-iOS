//
//  GetProgressRoomDTO.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/24/24.
//

import Foundation

struct GetProgressRoomDTO: Decodable {
    let id: Int
    let goal: String
    let title: String
    let restrictApp: String
    let startDate: String?
    let endDate: String?
    let limitHour: Int
    let personnel: Int
    let memberCount: Int
    let remainingDay: Int
    let inviteCode: String
}

extension GetProgressRoomDTO {
    static let mock = GetProgressRoomDTO(id: 0, goal: "", title: "", restrictApp: "", startDate: nil, endDate: nil, limitHour: 0, personnel: 0, memberCount: 0, remainingDay: 0, inviteCode: "")
}
