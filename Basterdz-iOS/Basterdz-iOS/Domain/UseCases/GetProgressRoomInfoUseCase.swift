//
//  GetProgressRoomInfoUseCase.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/24/24.
//

import Foundation
import Combine

final class GetProgressRoomInfoUseCase {
    private let network: any RoomNetworkable
    
    init(network: any RoomNetworkable) {
        self.network = network
    }
    
    func execute(id: String) -> AnyPublisher<GetProgressRoomDTO, ErrorResponse> {
        network.getProgressRoom(id: id)
    }
}
