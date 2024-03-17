//
//  SendBoosterViewModel.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 3/17/24.
//

import Foundation
import Combine
import SwiftUI

final class SendBoosterViewModel: BaseCoordinator<BoosterFlow>, ViewModelable {
    weak var coordinator: BoosterCoordinator?
    
    @Published var state: State
    
    enum Action {
        case selectReceiver(String)
        case selectMessage
        case createMessage
        case sendButtonTap
    }
    
    struct State {
        var selectBooster: BoosterEntity
        var receiver: ChallengerEntity
        var message: String
        
    }
    
    init(
        coordinator: BoosterCoordinator, state: SendBoosterViewModel.State) {
            self.state = State(
                selectBooster: state.selectBooster,
                receiver: state.receiver,
                message: state.message
        )
        self.coordinator = coordinator
    }
    
    func action(_ action: Action) {
        switch action {
        case .selectReceiver(let nickname):
            state.receiver = ChallengerEntity(nickname: nickname, message: "", screenTime: "", percent: 0.0)
            push(BoosterFlow.selectMessage(state.selectBooster, state.receiver))
        case .createMessage:
            push(BoosterFlow.createMessage(state.selectBooster, state.receiver))
        case .selectMessage:
            push(BoosterFlow.selectMessage(state.selectBooster, state.receiver))
        case .sendButtonTap:
            push(BoosterFlow.pushSuccess(state.receiver))
        }
    }
    
}
