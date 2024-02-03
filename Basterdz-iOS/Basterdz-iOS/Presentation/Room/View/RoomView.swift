//
//  RoomView.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2024/02/01.
//

import SwiftUI

struct RoomView: View {
    
    // push하는 방식을 UIKit로 할지 NavigationStack으로 할지 고민입니다 ㅠ
    @State var path: [NextViewContent] = []
    
    var body: some View {
        NavigationStack(path: $path) {
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
                            path.append(
                                NextViewContent(type: .createRoom)
                            )
                        }
                    )
                    
                    RoomMainButton(
                        image: "envelope.open",
                        title: "초대코드",
                        description: "친구 방에 들어갈거에요!",
                        action: {
                            path.append(
                                NextViewContent(type: .enterInviteCode)
                            )
                        }
                    )
                    
                }.padding(.horizontal, 16)
            }
        }
        .navigationDestination(for: NextViewContent.self) { next in
            switch next.type {
            case .createRoom:
                EnterRoomNameView()
            case .enterInviteCode:
                EnterRoomNameView()
            }
        }
    }
    
    
    
}

struct NextViewContent: Hashable {
    let type: RoomType
    
    enum RoomType {
        case createRoom
        case enterInviteCode
    }
}




#Preview {
    RoomView()
}
