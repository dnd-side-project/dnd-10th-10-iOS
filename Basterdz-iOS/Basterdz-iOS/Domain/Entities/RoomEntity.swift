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
    var restrictAppType: RestrictAppType = .instagram
    var startTimeStamp: String = ""
    var endTimeStamp: String = ""
    
    enum RestrictAppType: String {
        case instagram
        case youtube
        case tictok
        case netflix
        case x
    }
    

}
