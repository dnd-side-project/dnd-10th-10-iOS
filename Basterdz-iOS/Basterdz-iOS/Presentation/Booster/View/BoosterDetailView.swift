//
//  BoosterDetailView.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/24/24.
//

import SwiftUI

struct BoosterDetailView: View {
    @StateObject var viewModel: BoosterViewModel
    
    @State private var currentTab: SendBoosterTabItem = .available
    
    @Namespace private var animation
    private let columns: [GridItem] = Array(repeating: .init(spacing: 16), count: 4)
    private let chipRows = [GridItem(.flexible(maximum: 100))]
    
    enum SendBoosterTabItem: CaseIterable {
        case available, done
        
        var title: String {
            switch self {
            case .available: "사용 가능"
            case .done: "사용 완료"
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 16) {
            BasterdzNavigationBar(
                leadingItem: (.arrow_back, {
                    viewModel.pop()
                })
            )
            ZStack {
                VStack {
                    Image(BasterdzImage.profile_red)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    
                    Text("우리들의 도파민 탈출기")
                        .font(.pretendardB(24))
                        .foregroundStyle(Color(.mainBlack))
                    
                    Text("언제부터 인스타그램이 있었다고..")
                        .font(.pretendardM(16))
                        .foregroundStyle(Color(.grey5))
                    
                    tabBar()
                    ScrollView {
                        tabContent(currentTab)
                    }
                    .frame(maxHeight: .infinity)
                }
            }
        }
    }
}

private extension BoosterDetailView {
    @ViewBuilder func tabBar() -> some View {
        LazyVGrid(columns: columns, content: {
            ForEach(SendBoosterTabItem.allCases, id: \.title) { tab in
                Text(tab.title)
                    .tag(tab)
                    .font(.pretendardB(16))
                    .foregroundStyle(
                        currentTab == tab
                        ? Color(.mainBlack)
                        : Color(.grey3)
                    )
                    .frame(height: 48)
                    .onTapGesture {
                        withAnimation { currentTab = tab }
                    }
                    .overlay(alignment: .bottom) {
                        if currentTab == tab {
                            Rectangle()
                                .frame(height: 2)
                                .frame(maxWidth: .infinity)
                                .foregroundStyle(Color(.mainBlack))
                                .matchedGeometryEffect(id: "underline", in: animation)
                        }
                    }
            }
        })
        .padding(.horizontal, 12)
        .overlay(alignment: .bottom) {
            Rectangle()
                .frame(height: 1)
                .frame(maxWidth: .infinity)
                .foregroundStyle(Color(.grey1))
        }
    }
    
    @ViewBuilder func tabContent(_ tab: SendBoosterTabItem) -> some View {
        switch tab {
        case .available:
            if viewModel.state.boosterList.isEmpty {
                emptyTabContent()
            } else {
                boosterListTabContent(list: viewModel.state.boosterList, isFinish: false)
            }
        case .done:
            if viewModel.state.boosterList.isEmpty {
                emptyTabContent()
            } else {
                boosterListTabContent(list: viewModel.state.boosterList, isFinish: true)
            }
        }
    }
    
    @ViewBuilder func boosterListTabContent(list: [BoosterEntity], isFinish: Bool) -> some View {
        // TODO: api 오는 형태보고 id 변경 필요
        // header
        VStack {
            // 리스트
            ForEach(list, id: \.name) { booster in
                roomItem(room: booster, isFinish: isFinish)
                    .onTapGesture {
                        viewModel.action(.selectBooster(booster))
                    }
            }.padding(.horizontal, 16)
        }
    }
    
    @ViewBuilder func roomItem(room: BoosterEntity, isFinish: Bool) -> some View {
        VStack(alignment: .leading, spacing: 18) {
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    HStack(spacing: 4) {
                        Text("D-7")
                            .font(.pretendardB(12))
                            .foregroundStyle(Color(.white))
                    }
                    .padding(.horizontal, 7)
                    .padding(.vertical, 3)
                    .background(Color(.mainRed))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(width: 50, height: 20)
                    
                }
                HStack {
                    Text(room.name)
                        .font(.pretendardB(20))
                        .foregroundStyle(Color(.mainBlack))
                    Spacer()
                    Image(BasterdzImage.arrow_right)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
            }
            HStack {
                Text("2024.01.11 ~ 2024.02.11")
                    .font(.pretendardB(12))
                    .foregroundStyle(Color(.grey4))
            }
        }
        .padding(16)
        .roundedBorder(Color(.grey2))
    }
    
    @ViewBuilder func emptyTabContent() -> some View {
        VStack(spacing: 24) {
            Spacer(minLength: 120)
            Image(BasterdzImage.emptyRoom)
                .resizable()
                .scaledToFit()
                .frame(width: 140, height: 140)
            
            Text("아직 부스터가 없어요!".applyVariousFont(targetStringList: ["부스터"], font: .pretendardB(24)))
                .font(.pretendardM(24))
                .foregroundStyle(Color(.mainBlack))
            Spacer()
        }
        .frame(maxHeight: .infinity)
    }
}
