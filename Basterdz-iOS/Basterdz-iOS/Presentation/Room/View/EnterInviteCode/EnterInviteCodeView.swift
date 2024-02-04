//
//  EnterInviteCodeView.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/4/24.
//

import SwiftUI

struct EnterInviteCodeView: View {
    
    @State var inviteCode: String = ""
    
    var body: some View {
        CenterTextInputView(text: $inviteCode, placeholder: "초대 코드를 입력하세요!")
    }
}

#Preview {
    EnterInviteCodeView()
}
