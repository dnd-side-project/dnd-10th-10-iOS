//
//  SelectEndDateBottomView.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/17/24.
//

import SwiftUI

struct SelectPeriodBottomView: View {
    
    @StateObject var viewModel: EnterRoomDescriptionViewModel
    @Binding var showModal: Bool
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    var body: some View {
        VStack(spacing: 16) {
            Text("디데이 기간을 설정하세요")
                .font(.pretendardB(16))
                .foregroundStyle(Color(.mainBlack))
                .padding(20)
           
            Picker("", selection: $viewModel.state.roomEntity.period) {
                ForEach(1...31, id: \.self) {
                     Text("\($0)일")
                   }
                 }
                 .pickerStyle(.wheel)
                 .padding()
            
            Spacer()
            HStack {
                BasterdzBorderButton(title: "닫기", action: {
                    viewModel.state.roomEntity.period = 0
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
