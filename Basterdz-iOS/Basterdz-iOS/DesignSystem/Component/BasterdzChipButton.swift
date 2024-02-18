//
//  BasterdzChipButton.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/18/24.
//

import SwiftUI

struct BasterdzChipButton: View {
    private let title: String
    private let image: BasterdzImage?
    private let size: ChipSize
    private let action: (() -> Void)?
    private let mode: Mode
    
    init(
        title: String,
        image: BasterdzImage? = .none,
        size: ChipSize = .default,
        mode: Mode = .light,
        action: (() -> Void)? = .none
    ) {
        self.title = title
        self.image = image
        self.size = size
        self.mode = mode
        self.action = action
    }
    
    var body: some View {
        Button(
            action: action ?? {},
            label: {
                HStack(spacing: 4) {
                    if let image {
                        Image(image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: size.imageSize.width, height: size.imageSize.height)
                    }
                    Text(title)
                        .font(.pretendardB(size.fontSize))
                        .foregroundStyle(mode.foregroundColor)
                }
                .padding(size.padding)
                .background(mode.backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: size.height ))
                .frame(height: size.height)
        })
        
    }
    
    enum ChipSize {
        case small, `default`
        
        var height: CGFloat {
            switch self {
            case .small:
                return 20
            case .default:
                return 30
            }
        }
        var padding: CGFloat {
            switch self {
            case . small:
                return 6
            case .default:
                return 10
            }
        }
        var fontSize: CGFloat {
            switch self {
            case .small:
                return 8
            case .default:
                return 12
            }
        }
        var imageSize: CGSize {
            switch self {
            case .small:
                return CGSize(width: 12, height: 12)
            case .default:
                return CGSize(width: 20, height: 20)
            }
        }
    }
    
    enum Mode {
        case light, dark
        
        var foregroundColor: Color {
            switch self {
            case .light:
                return Color(.grey5)
            case .dark:
                return Color(.grey1)
            }
        }
        var backgroundColor: Color {
            switch self {
            case .light:
                return Color(.grey1)
            case .dark:
                return Color(.grey6)
            }
        }
    
    }
}
