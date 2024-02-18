//
//  RoomCoordinator.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2024/02/01.
//

import SwiftUI

enum RoomCoordinatorFlow: Hashable {
    case createRoom,
         enterInviteCode,
         enterRoomDescription(roomName: String),
         successCreateRoom(room: RoomEntity, inviteCode: String)
}

class RoomCoordinator: BaseCoordinator<RoomCoordinatorFlow> {
    
    @ViewBuilder func setView(_ action: RoomCoordinatorFlow) -> some View {
        switch action {
        case .createRoom:
            let viewModel = EnterRoomNameViewModel(coordinator: self)
            EnterRoomNameView(viewModel: viewModel)
        case .enterInviteCode:
            // TODO: viewModel DI 필요
            EnterInviteCodeView()
        case .enterRoomDescription(let roomName):
            let viewModel = EnterRoomDescriptionViewModel(coordinator: self, roomName: roomName)
            EnterRoomDescriptionView(viewModel: viewModel)
        case .successCreateRoom(let room, let inviteCode):
            let viewModel = AfterCreateRoomViewModel(coordinator: self, roomEntity: room, inviteCode: inviteCode)
            CreateRoomSuccessView(viewModel: viewModel)
        }
    }
}
