//
//  EnterRoomNameView.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/3/24.
//

import SwiftUI

struct EnterRoomNameView: View {
    
    @ObservedObject var viewModel: RoomViewModel
    
    @State var roomName: String = ""
    
    init(viewModel: RoomViewModel) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(spacing: 40) {
            BasterdzNavigationBar(
                centerTitle: "방 만들기",
                leadingItem: (.arrow_back, {
                    viewModel.path.removeLast()
                })
            )
            Text("도파민 탈출을 위한\n 방 이름을 만들어주세요!")
                .font(.pretendardB(20))
                .multilineTextAlignment(.center)
            BasterdzCenterTextEditor(text: $roomName, placeholder: "방 이름 입력하기")
            Spacer()
            
            BasterdzCommonButton(title: "다음으로", action: {
                viewModel.path.append(RoomFlowPath.enterRoomDescription)
            })
            .padding(20)
            .toolbar(.hidden, for: .navigationBar)
            .toolbar(.hidden, for: .tabBar)
        }
    }
}
