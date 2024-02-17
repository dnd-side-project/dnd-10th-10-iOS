//
//  RoomEntity.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/3/24.
//

import Foundation

struct RoomEntity: Hashable {
    var name: String = ""
    var goal: String = ""
    var restrictAppType: RestrictApp = .none
    var restrictAppTime: Int = 0
    var period: Int = 0
    var maxPeople: Int = 0
}
