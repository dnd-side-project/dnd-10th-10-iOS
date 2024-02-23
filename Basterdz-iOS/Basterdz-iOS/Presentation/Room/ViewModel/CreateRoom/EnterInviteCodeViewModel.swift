//
//  EnterInviteCodeViewModel.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2/23/24.
//

import SwiftUI
import Combine

class EnterInviteCodeViewModel: ViewModelable {
    
    @Published var state: State = State(inviteCode: "",
                                        showModal: false)
    weak var coordinator: RoomCoordinator?
    
    init(coordinator: RoomCoordinator) {
        self.coordinator = coordinator
    }
    
    enum Action {
        case backButtonDidTap
        case nextButtonDidTap
    }
    
    struct State {
        var inviteCode: String
        var isErrorMessageHidden: Bool {
            return inviteCode.count <= 8
        }
        var isNextButtonActive: Bool {
            return inviteCode.isNotEmpty && inviteCode.count <= 8
        }
        var showModal: Bool
    }
  
    func action(_ action: Action) {
        switch action {
        case .backButtonDidTap:
            coordinator?.pop()
        case .nextButtonDidTap: 
            // TODO: 서버 통신 예정
            break
        }
    }
}
