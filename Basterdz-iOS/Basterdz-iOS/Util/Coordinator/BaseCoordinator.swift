//
//  BaseCoordinator.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/18/24.
//

import Foundation
import SwiftUI

class BaseCoordinator<FlowPath: Hashable>: ObservableObject {
    @Published var path: [FlowPath] = []
    
    func push(_ action: FlowPath) {
        path.append(action)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder func setView(_ action: FlowPath) -> some View {
        EmptyView()
    }
}
