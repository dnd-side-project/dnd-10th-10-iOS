//
//  HomeView.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2024/02/01.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel
    @State private var plusButtonTap = false
    
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
                        plusButtonTap.toggle()
                    }, label: {
                        Image(BasterdzImage.plus)
                            .resizable()
                            .frame(width: 48, height: 48)
                    })
                    .padding(20)
                }
            }
            .fullScreenCover(isPresented: $plusButtonTap) {
                RoomView(coordinator: RoomCoordinator())
            }
        }
       
    }
}
