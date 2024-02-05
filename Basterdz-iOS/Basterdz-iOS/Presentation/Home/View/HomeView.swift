//
//  HomeView.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2024/02/01.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationStack(path: $viewModel.path) {
            VStack {
                BasterdzNavigationBar(
                    leadingItem: (.basterdz, {}),
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
    HomeView(viewModel: HomeViewModel())
}
