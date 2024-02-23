//
//  EnterRoomDescriptionViewModel.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2024/02/01.
//

import SwiftUI
import Combine

class EnterRoomDescriptionViewModel: ViewModelable {
    weak var coordinator: RoomCoordinator?
    
    enum Action {
        // modal 누르는 action
        case restrictAppModalButtonTap
        case maxPeopleModalButtonTap
        case restrictTimeModalButtonTap
        case periodModalButtonTap
        // modal 내 confirm action
        case restrictAppConfirmButtonTap(RestrictApp)
        case maxPeopleConfirmButtonTap(Int)
        case restrictTimeConfirmButtonTap(Int)
        case periodConfirmButtonTap(Int)
        // modal 내 cancel action
        case restrictAppCancelButtonTap
        case maxPeopleCancelButtonTap
        case restrictTimeCancelButtonTap
        case periodCancelButtonTap
        // bottom button action
        case bottomButtonTap
    }
    
    struct State {
        var roomEntity: RoomEntity
        var showModal: Bool
        var showContent: BottomSheetContent
        var goalErrorMessage: String {
            if  self.roomEntity.goal.count > BasterdzInt.goalNameCount.rawValue {
                return "\(BasterdzInt.goalNameCount.rawValue)자 이하만 입력가능합니다"
            } else {
                return ""
            }
        }
        // 각 버튼의 active 표시를 위한 연산 프로퍼티
        var isGoalButtonActive: Bool {
            self.roomEntity.goal.isNotEmpty
        }
        var isRestrictAppButtonActive: Bool {
            self.roomEntity.restrictAppType != .none
        }
        var isPeriodButtonActive: Bool {
            self.roomEntity.period != 0
        }
        var isRestrictTimeButtonActive: Bool {
            self.roomEntity.restrictAppTime != 0
        }
        var isMaxPeopleButtonActive: Bool {
            self.roomEntity.maxPeople != 0
        }
        
        var isBottomButtonActive: Bool {
            self.roomEntity.goal.count <= BasterdzInt.goalNameCount.rawValue &&
            self.roomEntity.restrictAppType != .none &&
            self.roomEntity.restrictAppTime != 0 &&
            self.roomEntity.maxPeople != 0 &&
            self.roomEntity.period != 0
        }
        
        enum BottomSheetContent {
            case restrictApp, period, restrictTime, maxPeople
        }
    }
    
    @Published var state: State = State(
        roomEntity: RoomEntity(),
        showModal: false,
        showContent: .restrictApp
    )
    
    private var inviteCode = "YXKRN95"
    private var store = Set<AnyCancellable>()
    
    // usecase
    private let createRoom: CreateRoomUseCase = CreateRoomUseCase(network: RoomAPIService())
    
    init(coordinator: RoomCoordinator, roomName: String) {
        self.coordinator = coordinator
        self.state.roomEntity.name = roomName
    }
    
    func action(_ action: Action) {
        switch action {
        case .restrictAppModalButtonTap:
            state.showModal = true
            state.showContent = .restrictApp
        case .maxPeopleModalButtonTap:
            state.showModal = true
            state.showContent = .maxPeople
        case .restrictTimeModalButtonTap:
            state.showModal = true
            state.showContent = .restrictTime
        case .periodModalButtonTap:
            state.showModal = true
            state.showContent = .period
            
        case .restrictAppConfirmButtonTap(let app):
            state.roomEntity.restrictAppType = app
        case .maxPeopleConfirmButtonTap(let maxPeople):
            state.roomEntity.maxPeople = maxPeople
        case .restrictTimeConfirmButtonTap(let time):
            state.roomEntity.restrictAppTime = time
        case .periodConfirmButtonTap(let period):
            state.roomEntity.period = period
            
        case .restrictAppCancelButtonTap:
            state.roomEntity.restrictAppType = .none
        case .maxPeopleCancelButtonTap:
            state.roomEntity.maxPeople = 0
        case .restrictTimeCancelButtonTap:
            state.roomEntity.restrictAppTime = 0
        case .periodCancelButtonTap:
            state.roomEntity.period = 0
            
        case .bottomButtonTap:
            createRoom.execute(room: state.roomEntity)
                .sink(receiveCompletion: { error in
                    print("finish \(error)")
                }, receiveValue: { response in
                    self.state.roomEntity.id = response.id
                    self.coordinator?.push(.successCreateRoom(room: self.state.roomEntity, inviteCode: response.inviteCode))
                    
                }).store(in: &store)
        }
    }
}
