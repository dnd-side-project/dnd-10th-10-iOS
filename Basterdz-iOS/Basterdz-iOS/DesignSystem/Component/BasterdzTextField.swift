//
//  TextInputView.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/3/24.
//
import SwiftUI

/// input을 입력받는 textField
struct BasterdzTextField<T: Hashable>: View {
    
    @Binding var text: String
    private let isActive: Bool
    private let isFocused: FocusState<T>.Binding
    private let focusValue: T
    private let placeholder: String
    private let trailingText: String?
    private let trailingButton: (String, () -> Void)?
    private let errorMessage: String
    
    init(
        text: Binding<String>,
        isActive: Bool,
        isFocused: FocusState<T>.Binding,
        focusValue: T = true,
        placeholder: String,
        trailingText: String? = .none,
        trailingButton: (String, () -> Void)? = .none,
        errorMessage: String = ""
    ) {
        self._text = text
        self.isActive = isActive
        self.isFocused = isFocused
        self.focusValue = focusValue
        self.placeholder = placeholder
        self.trailingText = trailingText
        self.trailingButton = trailingButton
        self.errorMessage = errorMessage
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 4) {
                TextField(placeholder, text: $text)
                    .autocorrectionDisabled()
                    .font(.pretendardB(16))
                    .foregroundStyle(Color(.mainBlack))
                    .focused(isFocused, equals: focusValue)
                    .padding(.horizontal, 16)
                    .frame(width: .infinity, height: 56)
                if let trailingText {
                    Text(trailingText)
                        .font(.pretendardM(13))
                        .foregroundStyle(Color(.mainBlack))
                        .padding(.horizontal, 16)
                }
                if let trailingButton {
                    Button(action: trailingButton.1, label: {
                        Image(trailingButton.0)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                    })
                }
            }
            .background(
                isActive ? Color(.white) : Color(.grey1)
            )
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .roundedBorder(
                isFocused.wrappedValue == focusValue ?
                (
                    errorMessage.isNotEmpty ?
                    BasterdzColor.mainRed.color :
                        BasterdzColor.mainBlack.color
                )
                :   BasterdzColor.grey3.color
            )
            if errorMessage.isNotEmpty {
                Text(errorMessage)
                    .font(.pretendardM(13))
                    .foregroundStyle(Color(.mainRed))
                    .frame(height: 16, alignment: .trailing)
            }
        }
        .frame(maxWidth: .infinity)
    }
}
