//
//  SelectMaxPeopleBottomView.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/4/24.
//

import SwiftUI

struct SelectMaxPeopleBottomView: View {
    
    @StateObject var viewModel: EnterRoomDescriptionViewModel
    @Binding var showModal: Bool
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        VStack(spacing: 16) {
            Text("참여인원을 설정해주세요.")
                .font(.pretendardB(16))
                .foregroundStyle(Color(.mainBlack))
                .padding(20)
            LazyVGrid(columns: columns) {
                ForEach(1..<7) { item in
                    BasterdzCommonButton(
                        title: "\(item)인",
                        action: {
                            viewModel.action(.maxPeopleConfirmButtonTap(item))
                        },
                        isActive: true
                    )
                }
            }
            .padding(.horizontal, 16)
            
            Spacer()
            HStack {
                BasterdzBorderButton(title: "닫기", action: {
                    viewModel.action(.maxPeopleCancelButtonTap)
                    showModal.toggle()
                })
                BasterdzCommonButton(
                    title: "완료",
                    style: .red,
                    action: {
                    showModal.toggle()
                    },
                    isActive: true
                )
            }
            .padding(20)
        }
    }
}
