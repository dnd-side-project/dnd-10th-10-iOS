//
//  ChallengeRoomViewModel.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/24/24.
//

import Foundation
import Combine

final class ChallengeRoomViewModel: ViewModelable {
    weak var coordinator: HomeCoordinator?
    
    private var store = Set<AnyCancellable>()
    
    @Published var state: State
    private let id: String
    
    private let getProgressRoomInfo = GetProgressRoomInfoUseCase(network: RoomAPIService())
    private let getScreenTime = GetRoomScreenTimeUseCase(network: RoomAPIService())
    private let getRank = GetRankUseCase(network: RoomAPIService())
    
    init(id: String, coordinator: HomeCoordinator) {
        self.state = State(room: GetProgressRoomDTO.mock, rankList: [], screenTimeList: [])
        self.id = id
        self.coordinator = coordinator
    }
    
    enum Action {
        case getData
    }
    
    struct State {
        var room: GetProgressRoomDTO
        var rankList: [RankDTO]
        var screenTimeList: [ScreenTimeDTO]
        
        var challengeList: [ChallengerEntity] {
            screenTimeList.map {
                .init(nickname: $0.nickName, message: "오늘도 파이팅:)", screenTime: $0.usageTime, percent: $0.percent)
            }
        }
    }
    
    func action(_ action: Action) {
        switch action {
        case .getData:
            getProgressRoomInfo.execute(id: id)
                .sink(receiveCompletion: { _ in }, receiveValue: {
                    self.state.room = $0
                }).store(in: &store)
            
            getRank.execute(id: id)
                .sink(receiveCompletion: { _ in }, receiveValue: {
                    self.state.rankList = $0
                }).store(in: &store)
                
            getScreenTime.execute(id: id)
                .sink(receiveCompletion: { _ in}, receiveValue: {
                    self.state.screenTimeList = $0
                    
                }).store(in: &store)
        }
    }
}
