//
//  EnterView.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2/12/24.
//

import SwiftUI

struct EnterInviteCodeView: View {
    
//    @ObservedObject private var viewModel: CreateRoomViewModel
    @State private var inviteCode: String = ""
    @FocusState private var isFocused: Bool
    
//    init(viewModel: CreateRoomViewModel) {
//        self._viewModel = ObservedObject(wrappedValue: viewModel)
//    }
    
    var body: some View {
        VStack {
            BasterdzNavigationBar(
                leadingItem: (.arrow_back, {
//                    viewModel.path.removeLast()
                })
            )
            .padding(.bottom, 50)
            
            Text("친구에게 받은\n초대코드를 입력해보세요!".applyVariousFont(targetStringList: ["초대코드"], font: .pretendardB(20)))
                .frame(minHeight: 48)
                .font(.pretendardM(20))
                .multilineTextAlignment(.center)
                .padding(14)
            
            Image(BasterdzImage.inviteCode)
                .resizable()
                .frame(width: 150, height: 150)
                .padding(7)
            
            TextField("", text: $inviteCode)
                .font(.pretendardB(20))
                .foregroundStyle(Color(.mainBlack))
                .frame(width: 205, height: 50)
                .background(Color(.white))
                .clipShape(RoundedRectangle(cornerRadius: 13))
                .roundedBorder(Color(.mainBlack))
                .focused($isFocused)
                .padding(8)
            
            Text("8자 이하만 입력 가능합니다")
                .font(.pretendardM(14))
                .foregroundStyle(Color(.mainRed))
            Spacer()
            
            BasterdzCommonButton(title: "다음", action: {
                // TODO: - 팝업 띄우기로 액션 수정 예정
            })
            .padding(.leading, 17)
            .padding(.trailing, 17)
        }
    }
}

//struct EnterView_Previews: PreviewProvider {
//    static var previews: some View {
//        EnterInviteCodeView(viewModel: CreateRoomViewModel())
//    }
//}
