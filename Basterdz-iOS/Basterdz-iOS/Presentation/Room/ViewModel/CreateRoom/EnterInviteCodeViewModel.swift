//
//  EnterInviteCodeViewModel.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2/23/24.
//

import SwiftUI
import Combine

class EnterInviteCodeViewModel: ViewModelable {
    
    @Published var state: State = State(inviteCode: "", room: RoomEntity.mocks[0],
                                        showModal: false)
    weak var coordinator: RoomCoordinator?
    private var store = Set<AnyCancellable>()
    
    init(coordinator: RoomCoordinator) {
        self.coordinator = coordinator
    }
    
    private let getRoomUsingInviteCode: GetRoomUsingInviteCodeUseCase = GetRoomUsingInviteCodeUseCase(network: RoomAPIService())
    
    enum Action {
        case backButtonDidTap
        case nextButtonDidTap
    }
    
    struct State {
        var inviteCode: String
        var room: RoomEntity
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
            getRoomUsingInviteCode.execute(inviteCode: state.inviteCode)
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { _ in
                    
                }, receiveValue: {
                    self.state.room = $0
                    self.state.showModal = true
                }).store(in: &store)
        }
    }
}
