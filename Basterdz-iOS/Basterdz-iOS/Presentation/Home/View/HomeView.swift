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
                    leadingItem: (.basterdz, {})
                )
                Spacer()
                
                HStack {
                    Spacer()
                    Button(action: {
                        viewModel.path.append(.plusButton)
                    }, label: {
                        Image(BasterdzImage.plus)
                            .resizable()
                            .frame(width: 48, height: 48)
                    })
                    .padding(20)
                }
            }
            .navigationDestination(for: HomeFlowPath.self) { path in
                switch path {
                case .plusButton:
                    RoomView(viewModel: RoomViewModel())
                        .toolbar(.hidden, for: .tabBar)
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}
