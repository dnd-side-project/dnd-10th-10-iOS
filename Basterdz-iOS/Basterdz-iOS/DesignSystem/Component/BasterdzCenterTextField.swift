//
//  TextInputView.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/3/24.
//
import SwiftUI

/// center로 input을 받는 inputView
struct BasterdzCenterTextField: View {
    
    @Binding var text: String
    private let placeholder: String
    
    init(
        text: Binding<String>,
        placeholder: String
    ) {
        self._text = text
        self.placeholder = placeholder
    }
    
    var body: some View {
        TextEditor(text: $text)
            .font(.pretendardB(20))
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

//#Preview {
//    @State var text = ""
//    return BasterdzCenterTextField(text: $text, placeholder: "미리보기")
//}
