//
//  RoomView.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2024/02/01.
//

import SwiftUI

struct RoomView: View {
    
    @StateObject var viewModel: RoomViewModel
    
    var body: some View {
        NavigationStack(path: $viewModel.path) {
            VStack {
                Text("도파민 탈출, 바스터즈와\n함께 시작해볼까요?")
                    .font(.pretendardB(24))
                    .multilineTextAlignment(.center)
                
                HStack(spacing: 20) {
                    BasterdzLargeButton(
                        image: .createRoom,
                        title: "방만들기",
                        description: "내가 방을 만들거에요!",
                        action: {
                            viewModel.path.append(RoomFlowPath.createRoom)
                        }
                    )
                    BasterdzLargeButton(
                        image: .enterInviteCode,
                        title: "초대코드",
                        description: "친구 방에 들어갈거에요!",
                        action: {
                            viewModel.path.append(RoomFlowPath.enterInviteCode)
                        }
                    )
                }.padding(.horizontal, 16)
            }
            .navigationBarBackButtonHidden()
            .navigationDestination(for: RoomFlowPath.self) { next in
                EnterRoomNameView(viewModel: viewModel)
                    .toolbar(.hidden, for: .tabBar)
                    .navigationBarBackButtonHidden()
            }
        }
    }
    
}
