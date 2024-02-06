//
//  RoomViewModel.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2024/02/01.
//

import Foundation

enum RoomFlowPath : String, Hashable{
    case createRoom
    case enterInviteCode
    case enterRoomDescription
}

class RoomViewModel: ObservableObject {
    @Published var path: [RoomFlowPath] = []
    @Published var roomEntity: RoomEntity = RoomEntity()
}
