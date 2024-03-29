//
//  TextInputView.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/3/24.
//
import SwiftUI

/// center로 input을 받는 inputView
struct BasterdzCenterTextEditor: View {
    
    @Binding var text: String
    private let placeholder: String
    private var textError: Bool
    
    init(
        text: Binding<String>,
        placeholder: String,
        textError: Bool
    ) {
        self._text = text
        self.placeholder = placeholder
        self.textError = textError
    }
    
    var body: some View {
        TextField("", text: $text)
            .autocorrectionDisabled()
            .font(.pretendardB(20))
            .foregroundStyle(
                textError ?
                Color(.mainRed) :
                    Color(.mainBlack)
            )
            .multilineTextAlignment(.center)
            .scrollContentBackground(.hidden)
            .frame(height: 120, alignment: .center)
            .padding(.trailing, 28)
            .background(alignment: .center, content: {
                if text.isEmpty {
                    Text(placeholder)
                        .font(.pretendardB(20))
                        .foregroundStyle(Color(.grey2))
                        .multilineTextAlignment(.center)
                }
            })
            .background(Color(.grey1))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding(16)
    }
}
