//
//  ChallengeRoomViewModel.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/24/24.
//

import Foundation

final class ChallengeRoomViewModel: ViewModelable {
    
    enum Action {
        case getData
    }
    
    struct State {
        var room: RoomEntity
    }
    
    func action(_ action: Action) {
        
    }
}
