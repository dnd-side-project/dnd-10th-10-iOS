//
//  GetRoomDTO.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/24/24.
//

import Foundation

struct GetRoomDTO: Decodable {
    let id: Int
    let title: String
    let restrictApp: String
    let limitHour: Int
    let targetDay: Int
}
