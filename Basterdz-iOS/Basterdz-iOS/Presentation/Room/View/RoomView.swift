//
//  RoomView.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2024/02/01.
//

import SwiftUI

struct RoomView: View {
 
    @StateObject var viewModel: RoomViewModel = RoomViewModel()
    
    var body: some View {
        NavigationStack(path: $viewModel.path) {
            VStack {
                Text("도파민 탈출, 바스터즈와\n함께 시작해볼까요?")
                    .font(.pretendardB(24))
                    .multilineTextAlignment(.center)
                
                HStack(spacing: 20) {
                    RoomMainButton(
                        image: "door.left.hand.closed",
                        title: "방만들기",
                        description: "내가 방을 만들거에요!",
                        action: {
                            viewModel.path.append(RoomFlowPath.createRoom
                                
                            )
                        }
                    )
                    
                    RoomMainButton(
                        image: "envelope.open",
                        title: "초대코드",
                        description: "친구 방에 들어갈거에요!",
                        action: {
                            viewModel.path.append(
                                RoomFlowPath.enterInviteCode
                            )
                        }
                    )
                    
                }.padding(.horizontal, 16)
            }
    
            .navigationDestination(for: RoomFlowPath.self) { next in
                switch next {
                case .createRoom:
                    EnterRoomNameView(viewModel: viewModel)
                        .toolbar(.hidden, for: .tabBar)
                case .enterInviteCode:
                    // https://github.com/exyte/PopupView 이라는 걸 많이 이용하시던데 어떠신가요?
                    EnterInviteCodeView()
                        .toolbar(.hidden, for: .tabBar)
                case .enterRoomDescription:
                    EnterRoomDescriptionView(viewModel: viewModel)
                }
            }
        }
        
    }
    
    
    
}

enum RoomFlowPath : String, Hashable{
    case createRoom
    case enterInviteCode
    case enterRoomDescription
}




#Preview {
    RoomView()
}
