//
//  MyPageView.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/6/24.
//

import SwiftUI

struct MyPageView: View {
    private let list = ["알림 설정", "공지사항", "환경설정", "로그아웃"]
    @State private var isOn = true
    
    var body: some View {
        ScrollView {
            BasterdzNavigationBar(
                leadingTitle: "마이페이지",
                trailingItemList: [
                    (BasterdzImage.alarm, {})
                ]
            )
            VStack(alignment: .leading) {
                Text("김도파민님!")
                    .font(.pretendardB(20))
                    .foregroundStyle(Color(.mainBlack))
                    .frame(alignment: .leading)
                
                Text("어제 보다 1시간 덜보셨네요!")
                .font(.pretendardB(24))
                .frame(alignment: .leading)
                
                RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(Color(.grey1))
                    .frame(height: 120)
                    .padding(16)
                
                HStack {
                    summeryCell(boosternum: 23, title: "이번달")
                    summeryCell(boosternum: 23, title: "지난주")
                    summeryCell(boosternum: 23, title: "오늘")
                }
            }
            .padding()
            .roundedBorder(Color(.grey1))
            .padding(.horizontal, 16)
            .padding(.vertical, 32)
            .frame(maxWidth: .infinity)
            
            ForEach(list, id: \.self) {
                mypageItem(title: $0)
            }
        }
    }
    
    @ViewBuilder func summeryCell(boosternum: Int, title: String) -> some View {
        VStack(spacing: 6) {
            Text(title)
                .font(.pretendardB(14))
                .foregroundStyle(Color(.grey5))
            
            Text("\(boosternum)시간")
                .font(.pretendardM(24))
                .foregroundStyle(Color(.mainBlack))
        }
        .padding()
        .background(Color(.grey1))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    @ViewBuilder func mypageItem(title: String) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.pretendardB(18))
                    .padding(.vertical, 12)
                
                    if title == "알림 설정" {
                        Spacer()
                        Toggle("", isOn: $isOn)
                            .tint(Color(.mainBlack))
                            .frame(width: 50, height: 20)
                    }
            }
            Divider()
        }.padding(.horizontal, 16)
    }
}

#Preview {
    MyPageView()
}
