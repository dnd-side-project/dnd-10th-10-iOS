//
//  SelectBoosterReceiverView.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/24/24.
//

import SwiftUI

struct SelectBoosterReceiverView: View {
    @StateObject var viewModel: SendBoosterViewModel
    
    private let title: AttributedString = "누구에게 부스터를 보낼까요?".applyVariousFont(targetStringList: ["부스터"], font: .pretendardB(24))
    
    private let firstRow: [Profile] = [
        Profile(nickname: "익명의 바스터", profileImageTitle: BasterdzImage.profile_enabled.rawValue),
        Profile(nickname: "익명의 바스터", profileImageTitle: BasterdzImage.profile_enabled.rawValue),
        Profile(nickname: "익명의 바스터", profileImageTitle: BasterdzImage.profile_enabled.rawValue)
    ]
    
    private let secondRow: [Profile] = [
        Profile(nickname: "익명의 바스터", profileImageTitle: BasterdzImage.profile_enabled.rawValue),
        Profile(nickname: "익명의 바스터", profileImageTitle: BasterdzImage.profile_enabled.rawValue)
    ]
    
    var body: some View {
        VStack {
            BasterdzNavigationBar(
                leadingItem: (BasterdzImage.arrow_back, {
                    viewModel.coordinator?.pop()
                }),
                trailingItemList: [
                    (BasterdzImage.x, {
                        viewModel.coordinator?.popToRoot()})
                ]

            )
            Text(title)
                .font(.pretendardM(24))
                .multilineTextAlignment(.center)
                .padding(.top, 167)
                .padding(.bottom, 46)
            
            VStack {
                HStack(spacing: 20) {
                    ForEach(firstRow, id: \.self) { element in
                        ProfileCellView(profile: element)
                            .onTapGesture {
                                viewModel.action(.selectReceiver(element.nickname))
                            }
                    }
                }
                .padding(.bottom, 24)
                
                HStack(spacing: 20) {
                    ForEach(secondRow, id: \.self) { element in
                        ProfileCellView(profile: element)
                            .onTapGesture {
                                viewModel.action(.selectReceiver(element.nickname))
                            }
                    }
                }
            }
            
            Spacer()
        }
    }
}
