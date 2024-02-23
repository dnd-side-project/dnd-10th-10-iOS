//
//  CreateRoomUseCase.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/21/24.
//

import Foundation
import Combine

final class CreateRoomUseCase {
    private let network: any RoomNetworkable
    
    init(network: any RoomNetworkable) {
        self.network = network
    }
    
    func execute(room: RoomEntity) -> AnyPublisher<String, ErrorResponse> {
        network.createRoom(room: room)
    }
}
