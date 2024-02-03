//
//  TestCommonButtonView.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/3/24.
//

import SwiftUI

struct TestCommonButtonView: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        VStack {
            
            // toggle되는 버튼
            CommonButton(
                title: "방 생성하기",
                style: .red,
                action: { isActive.toggle()},
                isActive: isActive
            )
                .padding(.horizontal, 20)
            
            CommonButton(
                title: "방 생성하기",
                style: .red,
                action: { },
                isActive: false
            )
                .padding(.horizontal, 20)
            CommonButton(
                title: "방 생성하기",
                style: .red,
                action: {},
                isActive: true
            )
                .padding(.horizontal, 20)
            
            CommonButton(
                title: "방 생성하기",
                action: {},
                isActive: false
            )
                .padding(.horizontal, 20)
            CommonButton(
                title: "방 생성하기",
                action: {},
                isActive: true
            )
                .padding(.horizontal, 20)
            
            HStack {
                CommonButton(
                    title: "2 시간",
                    size: .large,
                    style: .red,
                    action: {},
                    isActive: false
                )
                CommonButton(
                    title: "1 시간",
                    size: .large,
                    style: .red,
                    action: {},
                    isActive: true
                )
            }.padding(20)
        }
    }
}

#Preview {
    TestCommonButtonView(isActive: false)
}
