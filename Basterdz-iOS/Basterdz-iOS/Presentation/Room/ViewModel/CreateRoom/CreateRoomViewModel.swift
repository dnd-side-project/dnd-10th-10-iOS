//
//  CreateRoomViewModel.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2024/02/01.
//

import Foundation
import SwiftUI
import Combine

class CreateRoomViewModel: ViewModelable {
    weak var coordinator: RoomCoordinator?
    
    @Published var roomEntity: RoomEntity = RoomEntity()
    @Published var goalErrorMessage = ""
    
    private var inviteCode = "YXKRN95"
    
    var isCreateRoomButtonActive: Bool {
        roomEntity.goal.count <= 20 &&
        roomEntity.restrictAppType != .none &&
        roomEntity.restrictAppTime != 0 &&
        roomEntity.maxPeople != 0 &&
        roomEntity.period != 0
    }
    
    private var store = Set<AnyCancellable>()
    
    init(coordinator: RoomCoordinator, roomName: String) {
        self.coordinator = coordinator
        self.roomEntity.name = roomName
        bind()
    }
    
    enum Action {
        case bottomButtonTap
    }
    
    private func bind() {
        $roomEntity.sink {
            if  $0.goal.count > 20 {
                self.goalErrorMessage = "20자 이하만 입력가능합니다"
            } else {
                self.goalErrorMessage = ""
            }
            
        }.store(in: &store)
    }
  
    func reduce(_ action: Action) {
        switch action {
        case .bottomButtonTap:
            coordinator?.push(.successCreateRoom(room: roomEntity, inviteCode: inviteCode))
        }
    }
  
}
