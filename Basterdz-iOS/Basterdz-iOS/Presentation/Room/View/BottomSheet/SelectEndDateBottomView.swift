//
//  SelectEndDateBottomView.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/17/24.
//

import SwiftUI

struct SelectEndDateBottomView: View {
    
    @StateObject var viewModel: CreateRoomViewModel
    @Binding var showModal: Bool
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    var body: some View {
        VStack(spacing: 16) {
            Text("디데이 기간을 설정하세요")
                .font(.pretendardB(16))
                .foregroundStyle(Color(.mainBlack))
                .padding(20)
           
            DatePicker(
                selection: $viewModel.roomEntity.endTimeStamp,
                in: Date()...,
                displayedComponents: .date,
                label: {EmptyView()}
            )
            .datePickerStyle(.wheel)
            
            Spacer()
            HStack {
                BasterdzBorderButton(title: "닫기", action: {
                    viewModel.roomEntity.endTimeStamp = Date()
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
