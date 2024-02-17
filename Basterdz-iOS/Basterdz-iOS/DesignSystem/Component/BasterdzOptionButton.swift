//
//  InputButton.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/3/24.
//
import SwiftUI

struct BasterdzOptionButton<T: Hashable>: View {
    private let isActive: Bool
    private let isFocused: FocusState<T>.Binding?
    private let focusValue: T?
    private let action: () -> Void
    private let label: String
    private let image: String
    
    init(
        isActive: Bool,
        isFocused: FocusState<T>.Binding? = nil,
        focusValue: T = true,
        action: @escaping () -> Void,
        label: String,
        image: String = BasterdzImage.arrow_down.rawValue
    ) {
        self.isActive = isActive
        self.isFocused = isFocused
        self.focusValue = focusValue
        self.action = action
        self.label = label
        self.image = image
    }
    
    var body: some View {
        Button(action: action, label: {
            HStack {
                Text(label)
                    .font(.pretendardB(16))
                Spacer()
                Image(image, bundle: nil)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 14, height: 14)
            }.padding()
        })
        .buttonStyle(
            OptionButtonStyle(isActive: isActive)
        )
        .frame(height: 50)
    }
}

struct OptionButtonStyle: ButtonStyle {

    private let isActive: Bool
    
    init(isActive: Bool) {
        self.isActive = isActive
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(
                configuration.isPressed ? BasterdzColor.mainBlack.color : BasterdzColor.grey3.color
            )
            .background(
                isActive ? Color(.white) : Color(.grey1)
            )
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .frame(height: 50)
            .roundedBorder(
                configuration.isPressed ? BasterdzColor.mainBlack.color : BasterdzColor.grey3.color
            )
    }
}
