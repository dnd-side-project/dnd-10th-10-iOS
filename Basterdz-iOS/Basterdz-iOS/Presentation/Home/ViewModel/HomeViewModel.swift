//
//  HomeViewModel.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2024/02/01.
//

import Foundation


final class HomeViewModel: ViewModelable {
    var coordinator: HomeCoordinator
    @Published var state: State
    
    struct State {
        var fullRoomList: [RoomEntity]
        var progressRoomList: [RoomEntity]
        var finishRoomList: [RoomEntity]
    }
    
    enum Action {
        case getDatas
        case chipButtonTap(RestrictApp)
        case roomTap(RoomEntity)
        case plusButtonTap
    }
    
    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
        self.state = State(fullRoomList: [], progressRoomList: [], finishRoomList: [])
    }
    
    func action(_ action: Action) {
        switch action {
        case .getDatas:
            state.fullRoomList = RoomEntity.mocks
            self.action(.chipButtonTap(.none))
        case .chipButtonTap(let restrictApp):
            if restrictApp == .none {
                state.progressRoomList = state.fullRoomList.filter {$0.status != .finish}
                state.finishRoomList = state.fullRoomList.filter {$0.status == .finish}
            } else {
                state.progressRoomList = state.fullRoomList.filter {
                    $0.status != .finish && $0.restrictAppType == restrictApp
                }
                state.finishRoomList = state.fullRoomList.filter {
                    $0.status == .finish && $0.restrictAppType == restrictApp
                }
            }
        case .roomTap(let room):
            coordinator.push(.detail)
        case .plusButtonTap:
            coordinator.push(.plusButton)
        }
    }
}
