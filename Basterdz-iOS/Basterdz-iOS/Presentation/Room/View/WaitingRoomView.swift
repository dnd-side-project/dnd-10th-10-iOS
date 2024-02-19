//
//  WaitingRoomView.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2/18/24.
//

import SwiftUI

// TODO: 서버 response에 따라서 해당 모델 바뀔 수 있음. 확정 시 전역으로 빼기
struct Profile: Hashable {
    let nickname: String
    let profileImageTitle: String
}

struct WaitingRoomView: View {
    
    private let disabledTitle: AttributedString = "초대한 인원들을\n조금만 기다려주세요!".applyVariousFont(targetStringList: ["조금만 기다려주세요!"], font: .pretendardB(24))
    private let enabledTitle: AttributedString = "초대한 인원이\n다 모였어요!".applyVariousFont(targetStringList: ["다 모였어요!"], font: .pretendardB(24))
    private let firstRow: [Profile] = [
        Profile(nickname: "익명의 바스터", profileImageTitle: BasterdzImage.profile_enabled.rawValue),
        Profile(nickname: "익명의 바스터", profileImageTitle: BasterdzImage.profile_enabled.rawValue),
        Profile(nickname: "익명의 바스터", profileImageTitle: BasterdzImage.profile_enabled.rawValue)
    ]
    
    private let secondRow: [Profile] = [
        Profile(nickname: "익명의 바스터", profileImageTitle: BasterdzImage.profile_enabled.rawValue),
        Profile(nickname: "익명의 바스터", profileImageTitle: BasterdzImage.profile_enabled.rawValue)
    ]
    
    var body: some View {
        VStack {
            Text(disabledTitle)
                .font(.pretendardM(24))
                .multilineTextAlignment(.center)
                .padding(.top, 167)
                .padding(.bottom, 46)
            
            VStack {
                HStack(spacing: 20) {
                    ForEach(firstRow, id: \.self) { element in
                        ProfileCellView(profile: element)
                    }
                }
                .padding(.bottom, 24)
                
                HStack(spacing: 20) {
                    ForEach(secondRow, id: \.self) { element in
                        ProfileCellView(profile: element)
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

struct ProfileCellView: View {
    
    private let profile: Profile
    
    init(profile: Profile) {
        self.profile = profile
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Image(profile.profileImageTitle)
            Text(profile.nickname)
                .font(.pretendardB(14))
                .foregroundStyle(Color(.grey5))
        }
    }
}
