//
//  WaitingRoomView.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2/18/24.
//

import SwiftUI

struct Profile: Hashable {
    let nickname: String
    let profileImageTitle: String
}

struct WaitingRoomView: View {
    
    private let enabledTitle: AttributedString = "초대한 인원들을\n조금만 기다려주세요!".applyVariousFont(targetStringList: ["조금만 기다려주세요!"], font: .pretendardB(24))
    private let dummyData: [Profile] = [
        Profile(nickname: "익명의 바스터", profileImageTitle: BasterdzImage.profile_enabled.rawValue),
        Profile(nickname: "익명의 바스터", profileImageTitle: BasterdzImage.profile_enabled.rawValue),
        Profile(nickname: "익명의 바스터", profileImageTitle: BasterdzImage.profile_enabled.rawValue)
    ]
    
    private let dummyData2: [Profile] = [
        Profile(nickname: "익명의 바스터", profileImageTitle: BasterdzImage.profile_enabled.rawValue),
        Profile(nickname: "익명의 바스터", profileImageTitle: BasterdzImage.profile_enabled.rawValue)
    ]
    
    var body: some View {
        VStack {
            Text(enabledTitle)
                .font(.pretendardM(24))
                .multilineTextAlignment(.center)
                .padding(.top, 167)
                .padding(.bottom, 46)
            
            VStack {
                HStack(spacing: 20) {
                    ForEach(dummyData, id: \.self) { element in
                        VStack(alignment: .center, spacing: 10) {
                            Image(element.profileImageTitle)
                            Text(element.nickname)
                                .font(.pretendardB(14))
                                .foregroundStyle(Color(.grey5))
                        }
                    }
                }
                .padding(.bottom, 24)
                
                HStack(spacing: 20) {
                    ForEach(dummyData2, id: \.self) { element in
                        VStack(alignment: .center, spacing: 10) {
                            Image(element.profileImageTitle)
                            Text(element.nickname)
                                .font(.pretendardB(14))
                                .foregroundStyle(Color(.grey5))
                        }
                    }
                }
            }
            
            Spacer()
            
            BasterdzCommonButton(title: "시작하기", style: .red, action: {}, isActive: false)
                .padding(.leading, 17)
                .padding(.trailing, 17)
        }
    }
}

#Preview {
    WaitingRoomView()
}
