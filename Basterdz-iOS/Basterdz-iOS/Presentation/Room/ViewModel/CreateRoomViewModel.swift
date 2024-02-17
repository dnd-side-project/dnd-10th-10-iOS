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
    @Published var roomEntity: RoomEntity = RoomEntity()
    @Published var path: [RoomCoordinatorAction] = []
    @Published var roomError: Bool = false
    @Published var errorMessage = ""
    @Published var inviteCode = "YXKRN95"
    
    var isCreateRoomButtonActive: Bool {
        roomEntity.goal.count <= 20 &&
        roomEntity.restrictAppType != .none &&
        roomEntity.restrictAppTime != 0 &&
        roomEntity.maxPeople != 0 &&
        roomEntity.endTimeStamp > Date()
    }
    
    private var store = Set<AnyCancellable>()
    
    enum Action {
        case createRoomButtonTap
        case enterRoomDescriptionButtonTap
        case roomDescriptionButtonTap
        case enterInviteCodeButtonTap
    }
    
    init() {
        bind()
    }
    
    private func bind() {
        $roomEntity.sink {
            // 방이름
            self.roomError = $0.name.count > 15
            if  $0.name.count > 15 {
                self.errorMessage = "15자 이하만 입력가능합니다"
            } else {
                self.errorMessage = ""
            }
            // 목표 한마디
            if  $0.goal.count > 20 {
                self.errorMessage = "20자 이하만 입력가능합니다"
            } else {
                self.errorMessage = ""
            }
            
        }.store(in: &store)
    }
  
    func reduce(_ action: Action) {
        switch action {
        case .createRoomButtonTap:
            push(.createRoom)
        case .enterInviteCodeButtonTap:
            push(.enterInviteCode)
        case .enterRoomDescriptionButtonTap:
            push(.enterRoomDescription)
        case .roomDescriptionButtonTap:
            // TODO: 방 등록 usecase 필요
            push(.successCreateRoom)
        }
    }
  
}

extension CreateRoomViewModel {
    func push(_ action: RoomCoordinatorAction) {
        path.append(action)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder func setView(_ action: RoomCoordinatorAction) -> some View {
        switch action {
        case .createRoom:
            EnterRoomNameView(viewModel: self)
        case .enterInviteCode:
            EnterInviteCodeView(viewModel: self)
        case .enterRoomDescription:
            EnterRoomDescriptionView(viewModel: self)
        case .successCreateRoom:
            CreateRoomSuccessView(viewModel: self)
        }
    }
}
