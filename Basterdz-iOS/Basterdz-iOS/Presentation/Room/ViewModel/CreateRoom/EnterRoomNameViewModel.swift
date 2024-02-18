//
//  EnterRoomNameViewModel.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/17/24.
//

import SwiftUI
import Combine

class EnterRoomNameViewModel: ViewModelable {
    
    weak var coordinator: RoomCoordinator?
    
    @Published var state: State = State(roomName: "")
    
    init(coordinator: RoomCoordinator) {
        self.coordinator = coordinator
    }
    
    enum Action {
        case bottomButtonTap
    }
    
    struct State {
        var roomName: String
        
        var roomNameErrorMessage: String {
            if  self.roomName.count > BasterdzInt.roomNameCount.rawValue {
                return "\(BasterdzInt.roomNameCount.rawValue)자 이하만 입력가능합니다"
            } else {
                return ""
            }
        }
        var bottomButtonActive: Bool {
            self.roomName.isNotEmpty && self.roomNameErrorMessage.isEmpty
        }
    }
  
    func action(_ action: Action) {
        switch action {
        case .bottomButtonTap:
            coordinator?.push(.enterRoomDescription(roomName: state.roomName))
        }
    }
}
