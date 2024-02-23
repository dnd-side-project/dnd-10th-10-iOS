//
//  RoomEntity.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/3/24.
//

import Foundation

enum RoomStatus: Codable {
    case pending, finish, progress
}

struct RoomEntity: Hashable, Codable {
    
    var id: Int = 0
    var name: String = ""
    var goal: String = ""
    var restrictAppType: RestrictApp = .none
    var restrictAppTime: Int = 0
    var period: Int = 0
    var maxPeople: Int = 0
    
    var currentPeople: Int = 0
    var status: RoomStatus = .pending
    static let mocks: [RoomEntity] = [
        RoomEntity(
            name: "우리들의 도파민 탈출기",
            goal: "언제부터 인스타그램이 있었다고",
            restrictAppType: .instagram,
            restrictAppTime: 3,
            period: 40,
            maxPeople: 4
        ),
        RoomEntity(
            name: "우리들의 도파민 탈출기2",
            goal: "언제부터 유투브가 있었다고",
            restrictAppType: .youtube,
            restrictAppTime: 3,
            period: 40,
            maxPeople: 4
        ),
        RoomEntity(
            name: "우리들의 도파민 탈출기3",
            goal: "언제부터 틱톡이 있었다고",
            restrictAppType: .tictok,
            restrictAppTime: 3,
            period: 40,
            maxPeople: 4
        ),
        RoomEntity(
            name: "우리들의 도파민 탈출기4",
            goal: "언제부터 엑스가 있었다고",
            restrictAppType: .twitter,
            restrictAppTime: 3,
            period: 40,
            maxPeople: 4
        ),
        RoomEntity(
            name: "우리들의 도파민 탈출기5",
            goal: "언제부터 넷플릭스가 있었다고",
            restrictAppType: .netflix,
            restrictAppTime: 3,
            period: 40,
            maxPeople: 4
        )
    ]
}
