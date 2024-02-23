//
//  BasterdzPopUpView.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2/17/24.
//

import SwiftUI

struct BasterdzPopUpView: View {

    private let contentView: AnyView
    
    init(contentView: AnyView) {
        self.contentView = contentView
    }
    
    var body: some View {
        ZStack {
            Color(.backgroundBlack).ignoresSafeArea(edges: .all)
            
            ZStack(alignment: .center) {
                ZStack(alignment: .topTrailing) {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(Color(.white))
                        .frame(width: 340, height: 446)
                    Button {
                        // TODO: Action 추가 예정
                    } label: {
                        Image(BasterdzImage.x)
                    }
                    .offset(x: -20, y: 20)
                }
            }
            
            // TODO: Margin 값 조정하기 (기기대응 필요)
            contentView
                .padding(.init(top: 24, leading: 32, bottom: 0, trailing: 32))
        }
    }
}
