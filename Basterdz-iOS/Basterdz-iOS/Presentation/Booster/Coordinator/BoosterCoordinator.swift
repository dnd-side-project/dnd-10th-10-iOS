//
//  BoosterCoordinator.swift
//  Basterdz-iOS
//
//  Created by subin on 2024/02/01.
//

import SwiftUI

enum BoosterFlow: Hashable {
    case selectRoom(RoomEntity)
    case selectBoosterReceiver(BoosterEntity)
    case selectMessage(BoosterEntity, ChallengerEntity)
    case createMessage(BoosterEntity, ChallengerEntity)
    case pushSuccess(ChallengerEntity)
}

final class BoosterCoordinator: BaseCoordinator<BoosterFlow>, Observable {
    
    
    @ViewBuilder
    func setView(_ action: BoosterFlow) -> some View {
        switch action {
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
    
}
