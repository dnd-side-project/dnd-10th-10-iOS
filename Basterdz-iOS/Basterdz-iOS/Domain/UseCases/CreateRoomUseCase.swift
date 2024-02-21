//
//  CreateRoomUseCase.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/21/24.
//

import Foundation

final class CreateRoomUseCase {
    private let network: any RoomNetworkable
    
    init(network: any RoomNetworkable) {
        self.network = network
    }
    
    func execute(member: MemberEntity, room: RoomEntity) {
        // TODO
        network.createRoom(member: member, roomEntity: room)
    }
}
