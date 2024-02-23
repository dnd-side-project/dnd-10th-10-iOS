//
//  ShowInviteCodeView.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/17/24.
//
import SwiftUI

struct ShowInviteCodeView: View {
    @StateObject var viewModel: AfterCreateRoomViewModel
    
    var body: some View {
        VStack {
            BasterdzNavigationBar(
                leadingItem: (.arrow_back, {
                    viewModel.coordinator?.path.removeLast()
                })
            )
            .padding(.bottom, 50)
            
            Text("함께 할 친구를\n초대해보세요!".applyVariousFont(targetStringList: ["초대"], font: .pretendardB(20)))
                .font(.pretendardM(20))
                .multilineTextAlignment(.center)
                .padding(14)
            
            Image(BasterdzImage.inviteCode)
                .resizable()
                .frame(width: 150, height: 150)
                .padding(7)
            
            VStack {
                Text(viewModel.inviteCode)
                    .font(.pretendardM(24))
                    .foregroundStyle(Color(.mainBlack))
                Button(action: {
                    // TODO: 복사하기 로직 필요
                }, label: {
                    HStack {
                        Image(BasterdzImage.copy)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        Text("복사하기")
                            .foregroundStyle(Color(.grey5))
                    }
                })
            }
            .padding(.horizontal, 54)
            .padding(.vertical, 13)
            .background(Color(.grey1))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            
            Spacer()
            
            BasterdzCommonButton(
                title: "방 생성하기",
                style: .red,
                action: {
                // TODO: - 다음 뷰 필요
                })
            .padding(17)
        }
    }
}
