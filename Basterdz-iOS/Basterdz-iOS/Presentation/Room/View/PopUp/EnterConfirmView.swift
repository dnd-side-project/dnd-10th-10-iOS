//
//  EnterConfirmView.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2/17/24.
//

import SwiftUI

struct EnterConfirmView: View {
    
    @StateObject var viewModel: EnterInviteCodeViewModel
    
    var body: some View {
        VStack {
            Text("‘\(viewModel.state.room.name)'\n방에 입장해볼까요?"
                .applyVariousFont(targetStringList: ["방에 입장해볼까요?"], font: .pretendardB(20)))
                .font(.pretendardM(20))
                .multilineTextAlignment(.center)
                .padding(22)
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(Color(.grey1))
                    .frame(width: 308, height: 216)
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                
                VStack(alignment: .leading, spacing: 17) {
                    ChallengeInfo(key: "제한 앱", value: viewModel.state.room.restrictAppType.rawValue, icon: .appblocking)
                    ChallengeInfo(key: "스크린타임 제한 시간", value: "하루 \(viewModel.state.room.restrictAppTime)시간", icon: .timer)
                    ChallengeInfo(key: "종료일", value: "\(viewModel.state.room.period)", icon: .timeroff)
                }
                .offset(x: 49, y: 0)
            }
            .padding(.bottom, 25)
            
            HStack(spacing: 10) {
                BasterdzBorderButton(title: "뒤로가기",
                                     action: {})
                .padding(.leading, 16)
                
                BasterdzCommonButton(title: "입장하기",
                                     style: .red,
                                     action: {}, 
                                     isActive: true)
                .padding(.trailing, 16)
                
            }
            .padding(.bottom, 20)
        }
    }
}

struct ChallengeInfo: View {
    private let key: String
    private let value: String
    private let icon: BasterdzImage
    
    init(key: String,
         value: String,
         icon: BasterdzImage) {
        self.key = key
        self.value = value
        self.icon = icon
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Image(icon)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(key)
                    .font(.pretendardM(16))
                    .foregroundStyle(Color(.grey4))
                Text(value)
                    .font(.pretendardB(18))
                    .foregroundStyle(Color(.mainBlack))
            }
        }
    }
}
