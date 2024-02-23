//
//  BoosterSendSuccessView.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/24/24.
//

import SwiftUI

struct BoosterSendSuccessView: View {
    @StateObject var viewModel: BoosterViewModel
    
    var body: some View {
        BasterdzNavigationBar(
            trailingItemList: [
                (BasterdzImage.x, {
                    viewModel.popToRoot()
                })
            ]
        )
        VStack(spacing: 48) {
            Spacer()
            Image(BasterdzImage.boosterSendSuccess)
                .resizable()
                .frame(width: 120, height: 120)
            Text("바밤바님께\n부스터 발송 완료!"
                .applyVariousFont(
                    targetStringList: ["바밤바", "부스터 발송 완료!"],
                    font: .pretendardB(24)
                )
            )
            .font(.pretendardB(20))
            .foregroundStyle(Color(.mainBlack))
            .multilineTextAlignment(.center)
            Spacer()
        }
        
    }
}
