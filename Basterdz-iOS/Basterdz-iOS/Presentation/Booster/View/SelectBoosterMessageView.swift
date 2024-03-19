//
//  SelectBoosterMessageView.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/24/24.
//

import SwiftUI

struct SelectBoosterMessageView: View {
    @StateObject var viewModel: SendBoosterViewModel
    
    private let messageList = [
    "빨리 핸드폰 끄시게~",
    "인프루언서세요~?",
    "님 뭐하세요^^"
    ]
    @State var message = ""
    
    var body: some View {
        VStack {
            BasterdzNavigationBar(
                leadingItem: (
                    BasterdzImage.arrow_back, {
                        viewModel.coordinator?.pop()
                    }
                ),
                trailingItemList: [
                    (BasterdzImage.x, {
                        viewModel.coordinator?.popToRoot()
                    })
                ]
            )
            
            ZStack {
                VStack {
                    Rectangle()
                        .foregroundStyle(Color(.clear))
                        .frame(height: 100)
                    
                    ForEach(messageList, id: \.self) { message in
                        BasterdzCommonButton(
                            title: message,
                            size: .large,
                            action: {
                                self.message = message
                            },
                            isActive: true
                        )
                    }
                    
                    Button(action: {
                        viewModel.action(.createMessage)
                    }, label: {
                        VStack(spacing: 6) {
                            HStack {
                                Image(systemName: "plus")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 14, height: 14)
                                Text("직접 입력하기")
                                    .font(.pretendardB(16))
                            }
                            .foregroundStyle(Color(.mainBlack))
                            Text("친구를 자극할 메세지를 입력해주세요!")
                                .font(.pretendardB(14))
                                .foregroundStyle(Color(.grey3))
                                .frame(maxWidth: .infinity)
                        }
                        .padding(.horizontal, 48)
                        .padding(.vertical, 18)
                        .roundedBorder(BasterdzColor.mainBlack.color)
                        
                    })
                    .padding(.top, 32)
                }
                .padding()
                .roundedBorder(Color(.grey3))
                .padding()
                
                VStack(spacing: 0) {
                    Image(BasterdzImage.profile_red)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                    Text("바밤바")
                        .font(.pretendardB(18))
                        .foregroundStyle(Color(.mainBlack))
                }
                .offset(y: -200)
                
            }
            
            Spacer()
            BasterdzCommonButton(
                title: "부스터 보내기",
                size: .large, 
                style: .red,
                action: {
                    viewModel.action(.sendButtonTap)
                },
                isActive: message.isNotEmpty
            ).padding(17)
        }
        
    }
}
