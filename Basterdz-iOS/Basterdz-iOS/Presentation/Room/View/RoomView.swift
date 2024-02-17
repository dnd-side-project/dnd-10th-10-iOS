//
//  RoomView.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2024/02/01.
//

import SwiftUI

struct RoomView: View {
    
    @StateObject var viewModel: CreateRoomViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack(path: $viewModel.path) {
            BasterdzNavigationBar(
                leadingItem: (BasterdzImage.arrow_back, {
                    dismiss()
                })
            )
            VStack {
                Text("도파민 탈출, 바스터즈와\n함께 시작해볼까요?"
                    .applyVariousFont(
                        targetStringList: ["바스터즈"],
                        font: .pretendardB(20))
                )
                .font(.pretendardM(20))
                .multilineTextAlignment(.center)
                .padding(.top, 64)
                
                HStack(spacing: 20) {
                    BasterdzLargeButton(
                        image: .createRoom,
                        title: "방만들기",
                        description: "내가 방을 만들거에요!",
                        action: {
                            viewModel.reduce(.createRoomButtonTap)
                        }
                    )
                    BasterdzLargeButton(
                        image: .enterInviteCode,
                        title: "초대코드",
                        description: "친구 방에 들어갈거에요!",
                        action: {
                            viewModel.reduce(.enterInviteCodeButtonTap)
                        }
                    )
                }.padding(.horizontal, 16)
                Spacer()
            }
            .navigationBarBackButtonHidden()
            .navigationDestination(for: RoomCoordinatorAction.self) { path in
                viewModel.setView(path)
                    .toolbar(.hidden, for: .navigationBar)
                    .toolbar(.hidden, for: .tabBar)
            }
        }
    }
}
