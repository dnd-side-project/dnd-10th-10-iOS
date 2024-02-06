//
//  RoomEntity.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/3/24.
//

import Foundation

struct RoomEntity {
    var name: String = ""
    var goal: String = ""
    var restrictAppType: RestrictApp = .none
    var restrictAppTime: Int = 0
    var endTimeStamp: Date = Date()
    var maxPeople: Int = 0
}
