//
//  GetRoomUsingInviteCodeUseCase.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/24/24.
//

import Foundation
import Combine

final class GetRoomUsingInviteCodeUseCase {
    private let network: any RoomNetworkable
    
    init(network: any RoomNetworkable) {
        self.network = network
    }
    
    func execute(inviteCode: String) -> AnyPublisher<RoomEntity, ErrorResponse> {
        network.getRoom(inviteCode: inviteCode)
            .map { response in
                return RoomEntity(
                    id: response.id,
                    name: response.title,
                    restrictAppType: RestrictApp(serverString: response.restrictApp),
                    restrictAppTime: response.limitHour,
                    period: response.targetDay
                )
            }.eraseToAnyPublisher()
    }
}
