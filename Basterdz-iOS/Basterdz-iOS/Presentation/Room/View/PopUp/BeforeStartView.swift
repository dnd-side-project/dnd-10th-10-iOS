//
//  BeforeStartView.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2/21/24.
//

import SwiftUI

struct BeforeStartView: View {
    
    var body: some View {
        VStack {
            Image(BasterdzImage.redBomb)
                .padding(.bottom, 20)
            
            Text("초대한 인원이\n다 들어오지 않았어요!")
                .font(.pretendardB(24))
                .foregroundStyle(Color(.mainBlack))
                .multilineTextAlignment(.center)
                .padding(.bottom, 10)

            Text("방이 생성되면 추가 사용자를\n받을 수 없습니다!")
                .font(.pretendardM(16))
                .foregroundStyle(Color(.grey4))
                .multilineTextAlignment(.center)
                .padding(.bottom, 55)
            
            HStack(spacing: 10) {
                BasterdzBorderButton(title: "기다리기",
                                     action: {})
                
                BasterdzCommonButton(title: "시작하기",
                                     style: .red,
                                     action: {},
                                     isActive: true)
            }
            .padding(.leading, 16)
            .padding(.trailing, 16)
        }
        .padding(.bottom, 20)
    }
}
