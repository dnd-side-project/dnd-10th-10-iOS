//
//  SelectRestrictAppView.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/4/24.
//

import SwiftUI

struct SelectRestrictAppView: View {
    
    @StateObject var viewModel: CreateRoomViewModel
    @Binding var showModal: Bool
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    var body: some View {
        VStack(spacing: 16) {
            Text("제한할 앱을 선택하세요")
                .font(.pretendardB(16))
                .foregroundStyle(Color(.mainBlack))
                .padding(20)
            LazyVGrid(columns: columns) {
                ForEach(RestrictApp.allCases, id: \.self) { item in
                    if item != .none {
                        BasterdzCommonButton(
                            title: item.rawValue,
                            image: item.image,
                            action: {
                                viewModel.roomEntity.restrictAppType = item
                            },
                            isActive: true
                        )
                    }
                }
                
            }
            .padding(.horizontal, 16)
            
            Spacer()
            HStack {
                BasterdzBorderButton(title: "닫기", action: {
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
