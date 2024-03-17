//
//  BoosterRoomViewModel.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 3/17/24.
//

import Foundation
import Combine
import SwiftUI

final class BoosterRoomViewModel: ViewModelable {
    weak var coordinator: BoosterCoordinator?
    
    @Published var state: State
    
    enum Action {
        case selectBooster(BoosterEntity)
    }
    
    struct State {
        var boosterList: [BoosterEntity]
        var selectBooster: BoosterEntity
        var room: RoomEntity
        
    }
    
    init(coordinator: BoosterCoordinator, room: RoomEntity) {
        self.state = State(
            boosterList: BoosterEntity.mocks,
            selectBooster: BoosterEntity.mocks.first!,
            room: room
        )
        self.coordinator = coordinator
    }
    
    func action(_ action: Action) {
        switch action {
        case .selectBooster(let booster):
            coordinator?.push(BoosterFlow.selectBoosterReceiver(booster))
        }
    }
}
