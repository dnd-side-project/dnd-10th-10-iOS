//
//  SelectBoosterMessageView.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/24/24.
//

import SwiftUI

struct SelectBoosterMessageView: View {
    @StateObject var viewModel: BoosterViewModel
    
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
                        viewModel.pop()
                    }
                ),
                trailingItemList: [
                    (BasterdzImage.x, {
                        viewModel.popToRoot()
                    })
                ]
            )
            Spacer()
            ZStack {
                VStack {
                    Rectangle()
                        .foregroundStyle(Color(.white))
                        .frame(height: 100)
                    
                    ForEach(messageList, id: \.self) { message in
                        BasterdzCommonButton(
                            title: message,
                            size: .large,
                            action: {
                                self.message = message
                            }
                        )
                    }
                    
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
                .offset(y: -150)
                
            }
            
            Spacer()
            BasterdzCommonButton(
                title: "부스터 보내기",
                size: .large,
                action: {
                    viewModel.action(.selectMessage)
                },
                isActive: true
            ).padding(17)
        }
        
    }
}
