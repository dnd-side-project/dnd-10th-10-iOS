//
//  InputButton.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/3/24.
//
import SwiftUI

struct BasterdzOptionButton: View {
    private let isActive: Bool
    private let action: () -> Void
    private let label: String
    private let image: String
    
    init(
        isActive: Bool,
        action: @escaping () -> Void,
        label: String,
        image: String = Images.arrow_down.rawValue
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
                Image(image, bundle: nil)
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

#Preview {
    BasterdzOptionButton(
        isActive: true,
        action: {},
        label: "인스타그램"
    )
    .padding(20)
}
