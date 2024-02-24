//
//  HomeCoordinator.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/17/24.
//

import SwiftUI

enum HomeFlow: Hashable {
    case plusButton
    case detail(RoomEntity)
}

final class HomeCoordinator: BaseCoordinator<HomeFlow> {
    
    @ViewBuilder func setView(_ action: HomeFlow) -> some View {
        switch action {
        case .plusButton: EmptyView()
        case .detail(let room):
            ChallengeRoomView(viewModel: ChallengeRoomViewModel(id: "17", coordinator: self))
        }
    }
    
}
