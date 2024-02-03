//
//  InputButton.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/3/24.
//

import SwiftUI

/// inputView처럼 생겼지만 누르면 bottom sheet가 올라오는 게 동작 전부여서 button으로 생성했습니다 애매해서 확인 부탁드려요
struct InputButton: View {
    let isActive: Bool
    let action: () -> Void
    let label: String
    let image: String
    
    init(
        isActive: Bool,
        action: @escaping () -> Void,
        label: String,
        image: String = "chevron.compact.down"
    ) {
        self.isActive = isActive
        self.action = action
        self.label = label
        self.image = image
    }
    
    
    var body: some View {
        Button(action: action, label: {
            HStack {
                Text(label)
                    .font(.pretendardB(16))
                    .foregroundStyle(
                        isActive ?
                        Color(.mainBlack) :
                            Color(.grey2)
                    )
                Spacer()
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(Color(.mainBlack))
                    .frame(width: 14, height: 14)
            }
        })
        .padding()
        .frame(height: 56)
        .background(Color(.grey1))
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}
