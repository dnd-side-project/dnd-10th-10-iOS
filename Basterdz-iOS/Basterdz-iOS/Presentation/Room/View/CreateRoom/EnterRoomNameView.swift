//
//  EnterRoomNameView.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/3/24.
//

import SwiftUI

struct EnterRoomNameView: View {
    
    @ObservedObject var viewModel: CreateRoomViewModel
    
    init(viewModel: CreateRoomViewModel) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(spacing: 40) {
            BasterdzNavigationBar(
                centerTitle: "방 만들기",
                leadingItem: (.arrow_back, {
                    viewModel.path.removeLast()
                })
            )
            Text("도파민 탈출을 위한\n 방 이름을 만들어주세요!"
                .applyVariousFont(
                targetStringList: ["방 이름"],
                font: .pretendardB(20))
            )
                .font(.pretendardM(20))
                .multilineTextAlignment(.center)
            VStack(alignment: .trailing, spacing: 12) {
                BasterdzCenterTextEditor(
                    text: $viewModel.roomEntity.name,
                    placeholder: "방 이름 입력하기", 
                    textError: $viewModel.roomError
                )
                if viewModel.errorMessage.isEmpty {
                    Text("\(viewModel.roomEntity.name.count)/15자 이내")
                        .font(.pretendardM(14))
                        .foregroundStyle(Color(.grey3))
                        .padding(.trailing, 16)
                } else {
                    Text(viewModel.errorMessage)
                        .font(.pretendardM(14))
                        .foregroundStyle(Color(.mainRed))
                        .padding(.trailing, 16)
                }
            }
            Spacer()
            
            BasterdzCommonButton(
                title: "다음으로",
                style: .red,
                action: {
                    viewModel.reduce(.enterRoomDescriptionButtonTap)
                },
                isActive: viewModel.roomEntity.name.isNotEmpty && viewModel.errorMessage.isEmpty
            )
            .padding(20)
        }
    }
}
