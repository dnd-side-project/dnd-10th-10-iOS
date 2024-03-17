//
//  BoosterCoordinator.swift
//  Basterdz-iOS
//
//  Created by subin on 2024/02/01.
//

import SwiftUI

enum BoosterFlow {
    case mainView
    case selectRoom(RoomEntity)
    case selectBoosterReceiver(BoosterEntity)
    case selectMessage(BoosterEntity, ChallengerEntity)
    case createMessage(BoosterEntity, ChallengerEntity)
    case pushSuccess(ChallengerEntity)
}

final class BoosterCoordinator: BaseCoordinator<BoosterFlow> {
  
    
    override init() {
        super.init()
        self.path = [.mainView]
        
    }
    func setView(_ action: BoosterFlow) -> some View
    {
        Group {
            switch action {
            case .mainView:
                let viewModel = BoosterViewModel(coordinator: self)
                BoosterView(viewModel: viewModel)
            case .selectRoom(let room):
                let viewModel = BoosterRoomViewModel(coordinator: self, room: room)
                BoosterRoomDetailView(viewModel: viewModel)
            case .selectBoosterReceiver(let booster):
                let viewModel = SendBoosterViewModel(coordinator: self, state: SendBoosterViewModel.State(
                    selectBooster: booster,
                    receiver: ChallengerEntity.mock,
                    message: ""
                ))
                SelectBoosterReceiverView(viewModel: viewModel)
            case .selectMessage(let booster, let challenger):
                let viewModel = SendBoosterViewModel(coordinator: self, state: SendBoosterViewModel.State(
                    selectBooster: booster,
                    receiver: challenger,
                    message: ""
                ))
                SelectBoosterMessageView(viewModel: viewModel)
            case .createMessage(let booster, let challenger):
                let viewModel = SendBoosterViewModel(coordinator: self, state: SendBoosterViewModel.State(
                    selectBooster: booster,
                    receiver: challenger,
                    message: ""
                ))
                CreateCustomBoosterView(viewModel: viewModel)
            case .pushSuccess(let challenger):
                let viewModel = SendBoosterViewModel(coordinator: self, state: SendBoosterViewModel.State(
                    selectBooster: BoosterEntity(name: ""),
                    receiver: challenger,
                    message: ""
                ))
                BoosterSendSuccessView(viewModel: viewModel)
            }
        }
        .toolbar(.hidden, for: .navigationBar)
        .toolbar(.hidden, for: .tabBar)
        
    }
    
}

extension BoosterFlow: Hashable {
    static func == (lhs: BoosterFlow, rhs: BoosterFlow) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    func hash(into hasher: inout Hasher) {
            switch self {
            case .selectRoom(let roomEntity):
                hasher.combine("selectRoom")
                hasher.combine(roomEntity)
            case .selectBoosterReceiver(let boosterEntity):
                hasher.combine("selectBoosterReceiver")
                hasher.combine(boosterEntity)
            case .selectMessage(let boosterEntity, let challengerEntity):
                hasher.combine("selectMessage")
                hasher.combine(boosterEntity)
                hasher.combine(challengerEntity)
            case .createMessage(let boosterEntity, let challengerEntity):
                hasher.combine("createMessage")
                hasher.combine(boosterEntity)
                hasher.combine(challengerEntity)
            case .pushSuccess(let challengerEntity):
                hasher.combine("pushSuccess")
                hasher.combine(challengerEntity)
            case .mainView:
                hasher.combine("mainView")
            }
        }
}
