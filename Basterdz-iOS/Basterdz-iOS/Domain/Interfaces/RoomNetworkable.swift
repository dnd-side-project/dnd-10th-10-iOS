//
//  RoomNetworkable.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/23/24.
//

import Foundation
import Combine

protocol RoomNetworkable {
    func createRoom(room: RoomEntity) -> AnyPublisher<CreateRoomResponseDTO, ErrorResponse>
}
