//
//  SelectRestrictTimeView.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/4/24.
//

import SwiftUI

struct SelectRestrictTimeView: View {
    @StateObject var viewModel: RoomViewModel
    @Binding var showModal: Bool
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        VStack(spacing: 16){
            Text("하루 총 제한시간을 설정해주세요.")
                .font(.pretendardB(16))
                .foregroundStyle(Color(.mainBlack))
                .padding(20)
            LazyVGrid(columns: columns) {
                ForEach(1..<7) { item in
                    BasterdzCommonButton(title: "\(item)", action: {
                        viewModel.roomEntity.restrictAppTime = item
                        showModal.toggle()
                    })
                }
            }
            .padding(.horizontal, 16)
            
            HStack {
                BasterdzCommonButton(title: "닫기", action: {
                    showModal.toggle()
                })
                BasterdzCommonButton(title: "완료", style: .red, action: {
                    showModal.toggle()
                })
            }
            .padding(20)
        }
    }
}

