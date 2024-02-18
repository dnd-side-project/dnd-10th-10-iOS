//
//  BasterdzBorderButton.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/17/24.
//

import SwiftUI

struct BasterdzBorderButton: View {
    private let title: String
    private let image: BasterdzImage?
    private let isActive: Bool
    private let action: () -> Void
    
    init(
        title: String,
        image: BasterdzImage? = .none,
        action: @escaping () -> Void,
        isActive: Bool = true
    ) {
        self.title = title
        self.image = image
        self.action = action
        self.isActive = isActive
    }
    
    var body: some View {
        Button(action: {
            guard isActive else { return }
            action()
        }, label: {
            HStack(spacing: 8) {
                if let image {
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28, height: 28)
                }
                Text(title)
                    .font(.pretendardB(16))
            }
            .frame(height: 50)
            .frame(maxWidth: .infinity)
        })
        .buttonStyle(
            BorderButtonStyle(
                isActive: isActive
            )
        )
    }
}
struct BorderButtonStyle: ButtonStyle {
    
    private let isActive: Bool
    
    init(isActive: Bool) {
        self.isActive = isActive
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(
                isActive ?
                (configuration.isPressed ?
                 BasterdzColor.red2.color :
                    BasterdzColor.mainRed.color
                ) :
                    BasterdzColor.grey3.color
            )
            .background(Color(.white))
            .roundedBorder(
                isActive ?
                (configuration.isPressed ?
                 BasterdzColor.red2.color :
                    BasterdzColor.mainRed.color
                ) :
                    BasterdzColor.grey3.color
            )
    }
}
