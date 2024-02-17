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
                    leadingTitle: "부스터"
                )
                Spacer()
            }
            .navigationDestination(for: BoosterFlowPath.self) { _ in
                EmptyView()
            }
        }
    }
}
