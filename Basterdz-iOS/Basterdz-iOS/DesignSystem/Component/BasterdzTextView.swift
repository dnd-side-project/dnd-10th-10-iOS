//
//  TextInputView.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/3/24.
//
import SwiftUI

/// input을 입력받는 textField
struct BasterdzTextView<T: Hashable>: View {
    
    @Binding var text: String
    let isFocused: FocusState<T>.Binding
    let focusValue: T
    let placeholder : String
    let trailingText: String?
    let trailingButton: (String, () -> Void)? // 지금은 미사용이지만 나중에 들어갈까봐 일단 추가해놓음
    let errorMessage: String?
    
    init(
        text: Binding<String>,
        isFocused: FocusState<T>.Binding,
        focusValue: T = true,
        placeholder: String,
        trailingText: String? = .none,
        trailingButton: (String, () -> Void)? = .none,
        errorMessage: String? = .none
    ) {
        self._text = text
        self.isFocused = isFocused
        self.focusValue = focusValue
        self.placeholder = placeholder
        self.trailingText = trailingText
        self.trailingButton = trailingButton
        self.errorMessage = errorMessage
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            TextField(placeholder, text: $text)
                .font(.pretendardB(16))
                .foregroundStyle(Color(.mainBlack))
                .focused(isFocused, equals: focusValue)
                .padding(.horizontal, 16)
                .frame(height: 56)
                .background(Color(.grey1))
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .roundedBorder(
                    isFocused.wrappedValue == focusValue ?
                    BasterdzColor.mainBlack.color :
                        BasterdzColor.white.color
                )
                .overlay(alignment: .trailing) {
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
            if let errorMessage {
                Text(errorMessage)
                    .font(.pretendardM(13))
                    .foregroundStyle(Color(.mainRed))
                    .frame(height: 16)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    @State var text = ""
    @FocusState var isFocus
    
    return BasterdzTextView(
        text: $text,
        isFocused: $isFocus,
        focusValue: true,
        placeholder: "입력하시오", 
        trailingText: "4/20",
        trailingButton: nil,
        errorMessage: "에러"
    ).padding(20)
}
