//
//  EnterRoomNameViewModel.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/17/24.
//

import Foundation
import SwiftUI
import Combine

class EnterRoomNameViewModel: ViewModelable {
    
    weak var coordinator: RoomCoordinator?
    
    @Published var roomName = ""
    @Published var path: [RoomCoordinatorAction] = []
    @Published var roomNameErrorMessage = ""
    
    
    private var store = Set<AnyCancellable>()
    
    init(coordinator: RoomCoordinator) {
        self.coordinator = coordinator
        bind()
    }
    
    enum Action {
        case bottomButtonTap
    }
    
    private func bind() {
        $roomName.sink {
            // 방이름
            if  $0.count > 15 {
                self.roomNameErrorMessage = "\(BasterdzInt.roomNmaeCount.rawValue)자 이하만 입력가능합니다"
            } else {
                self.roomNameErrorMessage = ""
            }
        }.store(in: &store)
    }
  
    func reduce(_ action: Action) {
        switch action {
        case .bottomButtonTap:
            coordinator?.push(.enterRoomDescription(roomName: roomName))
        }
    }
  
}
