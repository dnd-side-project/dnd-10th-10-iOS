//
//  BoosterView.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2024/02/01.
//

import SwiftUI

struct BoosterView: View {
    @StateObject var viewModel: BoosterViewModel
    
    var body: some View {
        NavigationStack(path: $viewModel.path) {
            VStack {
                BasterdzNavigationBar(
                    leadingTitle: "부스터",
                    trailingItemList: [
                        (.mypage, {})
                    ]
                )
                Spacer()
            }
        }.navigationDestination(for: BoosterFlowPath.self) { path in
            EmptyView()
        }
    }
}

#Preview {
    BoosterView(viewModel: BoosterViewModel())
}
