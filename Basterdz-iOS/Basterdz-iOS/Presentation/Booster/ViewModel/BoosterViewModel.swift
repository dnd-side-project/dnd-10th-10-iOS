//
//  BoosterViewModel.swift
//  Basterdz-iOS
//
//  Created by subin on 2024/02/01.
//

import Foundation
import Combine
import SwiftUI

final class BoosterViewModel: BaseCoordinator<BoosterFlow>, ViewModelable {
    weak var coordinator: BoosterCoordinator?
    
    @Published var state: State
    let roomList = RoomEntity.mocks
    
    enum Action {
        case selectRoom(RoomEntity)
        case selectBooster(BoosterEntity)
        case selectReceiver(String)
        case selectMessage
        case sendButtonTap
    }
    
    struct State {
        var boosterList: [BoosterEntity]
        var selectBooster: BoosterEntity
        var room: RoomEntity
        var receiver: ChallengerEntity
        var message: String
        
    }
    
    init(coordinator: BoosterCoordinator) {
        self.state = State(
            boosterList: BoosterEntity.mocks,
            selectBooster: BoosterEntity.mocks.first!,
            room: RoomEntity.mocks.first!,
            receiver: ChallengerEntity(
                nickname: "바밤바",
                message: "",
                screenTime: ""
            ),
            message: "hi"
        )
        self.coordinator = coordinator
    }
    
    func action(_ action: Action) {
        switch action {
        case .selectRoom(let roomEntity):
            state.room = roomEntity
            push(BoosterFlow.selectRoom)
        case .selectBooster(let booster):
            state.selectBooster = booster
            push(BoosterFlow.selectBooster)
        case .selectReceiver(let nickname):
            state.receiver = ChallengerEntity(nickname: nickname, message: "", screenTime: "")
            push(BoosterFlow.enterMessage)
        case .selectMessage:
            push(BoosterFlow.pushSuccess)
        case .sendButtonTap:
            push(BoosterFlow.pushSuccess)
        }
    }
    
    @ViewBuilder func setView(_ action: BoosterFlow) -> some View {
        Group {
            switch action {
            case .selectRoom:
                BoosterDetailView(viewModel: self)
            case .selectBooster:
                SelectBoosterReceiverView(viewModel: self)
            case .selectBoosterReceiver:
                SelectBoosterReceiverView(viewModel: self)
            case .enterMessage:
                SelectBoosterMessageView(viewModel: self)
            case .pushSuccess:
                BoosterSendSuccessView(viewModel: self)
            }
        }
        .toolbar(.hidden, for: .navigationBar)
        .toolbar(.hidden, for: .tabBar)
    }
}
