//
//  RoomEntity.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/3/24.
//

import Foundation
enum RestrictAppType: String, CaseIterable {
    case instagram = "인스타그램"
    case youtube = "유투브"
    case tictok = "틱톡"
    case netflix = "넷플릭스"
    case x = "트위터"
}

struct RoomEntity {
    var name: String = ""
    var goal: String = ""
    var restrictAppType: RestrictAppType = .instagram
    var startTimeStamp: String = ""
    var endTimeStamp: String = ""
}
