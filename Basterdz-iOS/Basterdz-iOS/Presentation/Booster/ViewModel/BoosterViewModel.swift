//
//  BoosterViewModel.swift
//  Basterdz-iOS
//
//  Created by subin on 2024/02/01.
//

import Foundation
import Combine
import SwiftUI

final class BoosterViewModel: ViewModelable {
//    var coordinator: BoosterCoordinator
    
    @Published var state: State
    let roomList = RoomEntity.mocks
    
    enum Action {
        case selectRoom(RoomEntity)
    }
    
    struct State {
        var boosterList: [BoosterEntity]
        var selectBooster: BoosterEntity
        var room: RoomEntity
        
    }
    
    init() { //(coordinator: BoosterCoordinator) {
        self.state = State(
            boosterList: BoosterEntity.mocks,
            selectBooster: BoosterEntity.mocks.first!,
            room: RoomEntity.mocks.first!
        )
//        self.coordinator = coordinator
    }
    
    func action(_ action: Action) {
        switch action {
        case .selectRoom(let roomEntity):
            state.room = roomEntity
//            coordinator.push(BoosterFlow.selectRoom(roomEntity))
        }
    }
}
