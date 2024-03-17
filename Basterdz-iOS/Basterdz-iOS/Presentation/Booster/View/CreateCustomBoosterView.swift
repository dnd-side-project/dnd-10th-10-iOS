//
//  CreateCustomBoosterView.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 3/17/24.
//


import SwiftUI

struct CreateCustomBoosterView: View {
    @StateObject var viewModel: SendBoosterViewModel
    
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
            Rectangle()
                .foregroundStyle(Color(.clear))
                .frame(height: 100)
            
            ZStack {
                VStack {
                    Rectangle()
                        .foregroundStyle(Color(.clear))
                        .frame(height: 100)
                    
                    
                    VStack(spacing: 6) {
                        TextField("친구를 자극할 메세지를 입력해주세요!", text: $message)
                            .font(.pretendardB(14))
                            .foregroundStyle(
                                message.count <= BasterdzInt.goalNameCount.rawValue ?
                                BasterdzColor.grey3.color :
                                    BasterdzColor.mainRed.color
                            )
                            .frame(maxWidth: .infinity)
                            .padding()
                            .roundedBorder(
                                message.count <= BasterdzInt.goalNameCount.rawValue ?
                                BasterdzColor.grey3.color :
                                    BasterdzColor.mainRed.color
                            )
                        
                        HStack {
                            Spacer()
                            Text(
                                message.count <= BasterdzInt.goalNameCount.rawValue ?
                                "\(message.count)/\(BasterdzInt.goalNameCount.rawValue)" :
                                "20자 이하만 입력 가능합니다."
                            )
                                .font(.pretendardM(14))
                                .foregroundStyle(
                                    message.count <= BasterdzInt.goalNameCount.rawValue ?
                                    BasterdzColor.grey3.color :
                                        BasterdzColor.mainRed.color
                                )
                                .frame(alignment: .trailing)
                        }
                    }
                    .padding(.horizontal, 24)
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
                .offset(y: -80)
                
            }
            
            Spacer()
            BasterdzCommonButton(
                title: "부스터 보내기",
                size: .large,
                action: {
                    viewModel.action(.sendButtonTap)
                },
                isActive: message.count <= BasterdzInt.goalNameCount.rawValue && message.isNotEmpty
            ).padding(17)
        }
        
    }
}
