//
//  RoomAPIService.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/23/24.
//

import Foundation
import Combine

final class RoomAPIService: RoomNetworkable {
    
    private let service: APIService<RoomAPI>
    
    init() {
        self.service = APIService<RoomAPI>()
    }
    
    func createRoom(room: RoomEntity) -> AnyPublisher<String, ErrorResponse> {
        return service.mapAPIResponse(api: .createRoom(room: room))
    }
}
