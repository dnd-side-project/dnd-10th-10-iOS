//
//  CommonButton.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/3/24.
//

import Foundation

import SwiftUI

/// common button
/// button의 사이즈의 경우 width는 뷰에 따라 달라져서 infinity로 설정
struct BasterdzCommonButton: View {
    let title: String
    let image: Image?
    let size: CommonButtonSize
    let style: CommonButtonColor
    let isActive: Bool
    
    let action: () -> Void
    
    init(
        title: String,
        image: Image? = .none,
        size: CommonButtonSize = .large,
        style: CommonButtonColor = .black,
        action: @escaping () -> Void,
        isActive: Bool = false
    ) {
        self.title = title
        self.image = image
        self.size = size
        self.style = style
        self.action = action
        self.isActive = isActive
    }
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            HStack(spacing: 8) {
                if let image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28, height: 28)
                }
                Text(title)
                    .font(size.font)
            }
            .frame(height: size.height)
            .frame(maxWidth: .infinity)
        })
        .buttonStyle(CommonButtonStyle(
            foregroundColor: style.inactiveForeground,
            color: style,
            radius: size.radius,
            isActive: isActive
        ))
    }
}

struct CommonButtonStyle: ButtonStyle {
    
    let foregroundColor: Color
    let color: CommonButtonColor
    let radius: CGFloat
    let isActive: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(
                isActive ?
                color.activeForeground :
                    color.inactiveForeground
            )
            .background(
                isActive ?
                color.activeBackground :
                    color.inactiveBackground
            )
            .cornerRadius(radius)
    }
}

enum CommonButtonColor {
    
    case black, red
    
    var inactiveForeground: Color {
        switch self {
        case .black:
            return BasterdzColor.mainBlack.color
        case .red:
            return BasterdzColor.white.color
        }
    }
    
    var activeForeground: Color {
        switch self {
        case .black:
            return BasterdzColor.white.color
        case .red:
            return BasterdzColor.white.color
        }
    }
    
    
    var inactiveBackground: Color {
        switch self {
        case .black:
            return BasterdzColor.grey1.color
        case .red:
            return BasterdzColor.grey2.color
        }
    }
    
    var activeBackground: Color {
        switch self {
        case .black:
            return BasterdzColor.mainBlack.color
        case .red:
            return BasterdzColor.mainRed.color
        }
    }
}

enum CommonButtonSize {
    case large, small
    var font: Font {
        switch self {
        case .large:
            return Font.pretendardB(20)
        case .small:
            return Font.pretendardB(16)
        }
    }
    
    var height: CGFloat {
        switch self {
        case .large:
            return 60
        case .small:
            return 55
        }
    }
    
    var radius: CGFloat {
        switch self {
        case .large:
            return 15
        case .small:
            return 10
        }
    }
    
}

#Preview {
    BasterdzCommonButton(
        title: "인스타그램",
        image: Image(systemName: "square.and.arrow.up"),
        size: .large,
        style: .red,
        action: {},
        isActive: true
    ).padding(20)
}
