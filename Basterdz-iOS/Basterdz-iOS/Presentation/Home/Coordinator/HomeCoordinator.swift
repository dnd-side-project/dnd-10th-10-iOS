//
//  HomeCoordinator.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/17/24.
//

import SwiftUI

enum HomeFlow: String, Hashable {
    case plusButton
    case detail
}

final class HomeCoordinator: BaseCoordinator<HomeFlow> {
    
    @ViewBuilder func setView(_ action: RoomFlow) -> some View {
        // TODO
        EmptyView()
    }
    
}
