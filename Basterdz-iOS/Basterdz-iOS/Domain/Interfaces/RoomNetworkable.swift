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
    
    func getRoom(inviteCode: String) -> AnyPublisher<GetRoomDTO, ErrorResponse>
    
    func getProgressRoom(id: String) -> AnyPublisher<GetProgressRoomDTO,ErrorResponse>
    
    func getRank(id: String) -> AnyPublisher<[RankDTO],ErrorResponse>
    
    func getScreenTime(id: String) -> AnyPublisher<[ScreenTimeDTO], ErrorResponse>
}
