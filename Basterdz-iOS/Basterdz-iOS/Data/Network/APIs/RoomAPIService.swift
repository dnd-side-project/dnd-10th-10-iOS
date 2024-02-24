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
    
    func createRoom(room: RoomEntity) -> AnyPublisher<CreateRoomResponseDTO, ErrorResponse> {
        return service.mapAPIResponse(api: .createRoom(room: room))
    }
    
    func getRoom(inviteCode: String) -> AnyPublisher<GetRoomDTO, ErrorResponse> {
        return service.mapAPIResponse(api: .getRoomUsingCode(code: inviteCode))
    }
    func getProgressRoom(id: String) -> AnyPublisher<GetProgressRoomDTO, ErrorResponse> {
        return service.mapAPIResponse(api: .progressRoomDetail(id: id))
    }
    
    func getRank(id: String) -> AnyPublisher<[RankDTO], ErrorResponse> {
        return service.mapAPIResponse(api: .getRank(id: id, date: "2024-02-24")
        )
    }
    
    func getScreenTime(id: String) -> AnyPublisher<[ScreenTimeDTO], ErrorResponse> {
        return service.mapAPIResponse(api: .getScreenTime(id: id, date: "2024-02-24"))
    }
}
