//
//  AfterCreateRoomViewModel.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/17/24.
//

import Foundation

final class AfterCreateRoomViewModel: ObservableObject {
    weak var coordinator: RoomCoordinator?
    
    let roomEntity: RoomEntity
    let inviteCode: String
    
    init(coordinator: RoomCoordinator?, roomEntity: RoomEntity, inviteCode: String) {
        self.coordinator = coordinator
        self.roomEntity = roomEntity
        self.inviteCode = inviteCode
    }
}
