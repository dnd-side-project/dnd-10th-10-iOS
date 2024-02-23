//
//  EnterView.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2/12/24.
//

import SwiftUI

struct EnterInviteCodeView: View {
    
    @StateObject var viewModel: EnterInviteCodeViewModel
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack {
            BasterdzNavigationBar(
                leadingItem: (.arrow_back, {
                    viewModel.action(.backButtonDidTap)
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
            
            TextField("", text: $viewModel.state.inviteCode)
                .font(.pretendardB(20))
                .foregroundStyle(Color(.mainBlack))
                .frame(width: 205, height: 50)
                .background(Color(.white))
                .clipShape(RoundedRectangle(cornerRadius: 13))
                .multilineTextAlignment(.center)
                .roundedBorder( viewModel.state.isErrorMessageHidden ? Color(.mainBlack) : Color(.mainRed))
                .focused($isFocused)
                .padding(8)
            
            Text("8자 이하만 입력 가능합니다")
                .font(.pretendardM(14))
                .foregroundStyle(Color(.mainRed))
                .opacity(viewModel.state.isErrorMessageHidden ? 0 : 1)
            Spacer()
            
            BasterdzCommonButton(title: "다음",
                                 style: .red,
                                 action: {
                                    viewModel.action(.nextButtonDidTap) },
                                 isActive: viewModel.state.isNextButtonActive)
            .padding(.leading, 17)
            .padding(.trailing, 17)
            .fullScreenCover(isPresented: $viewModel.state.showModal) {
                BasterdzPopUpView(contentView: AnyView(EnterConfirmView(viewModel: viewModel)))
            }
        }
    }
}
