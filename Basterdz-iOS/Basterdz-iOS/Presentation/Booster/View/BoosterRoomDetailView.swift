//
//  BoosterRoomDetailView.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/24/24.
//

import SwiftUI

struct BoosterRoomDetailView: View {
    @StateObject var viewModel: BoosterRoomViewModel
    
    @State private var currentTab: SendBoosterTabItem = .available
    
    @Namespace private var animation
    private let columns: [GridItem] = Array(repeating: .init(spacing: 16), count: 4)
    private let chipRows = [GridItem(.flexible(maximum: 100))]
    
    enum SendBoosterTabItem: CaseIterable {
        case available, done
        
        var title: String {
            switch self {
            case .available: "사용가능"
            case .done: "사용완료"
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 16) {
            BasterdzNavigationBar(
                leadingItem: (.arrow_back, {
                    viewModel.coordinator?.pop()
                })
            )
            VStack {
                VStack(spacing: 6) {
                    HStack(spacing: -6) {
                        ForEach(0..<3, id: \.self) { _ in
                            Image(BasterdzImage.profile_red)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .roundedBorder(Color(.white), radius: 12)
                        }
                        Spacer()
                    }
                    .frame(height: 34)
                    
                    Text(viewModel.state.room.name)
                        .font(.pretendardB(24))
                        .foregroundStyle(Color(.mainBlack))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(viewModel.state.room.goal)
                        .font(.pretendardM(16))
                        .foregroundStyle(Color(.grey5))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxWidth: .infinity)
                .padding(16)
                
                tabBar()
                ScrollView {
                    tabContent(currentTab)
                }
                .frame(maxHeight: .infinity)
            }
        }
    }
}

private extension BoosterRoomDetailView {
    @ViewBuilder func tabBar() -> some View {
        LazyVGrid(columns: columns, content: {
            ForEach(SendBoosterTabItem.allCases, id: \.title) { tab in
                HStack {
                    Text(tab.title)
                        .tag(tab)
                        .font(.pretendardB(16))
                        .foregroundStyle(
                            currentTab == tab
                            ? Color(.mainBlack)
                            : Color(.grey3)
                        )
                    Text("3")
                        .font(.pretendardB(16))
                        .foregroundStyle(
                            currentTab == tab
                            ? Color(.mainRed)
                            : Color(.grey3)
                        )
                }
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
            Spacer()
            Menu {
                Button("최신순", action: {})
                Button("임박순", action: {})
            } label: {
                HStack {
                    Text("최신순")
                        .font(.pretendardM(13))
                    Image(.arrow_down)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 14, height: 14)
                }
                .foregroundStyle(Color(.grey5))
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
        VStack {
            ForEach(list, id: \.name) { booster in
                boosterItem(booster: booster, isFinish: isFinish)
            }.padding(.horizontal, 16)
        }
    }
    
    @ViewBuilder func boosterItem(booster: BoosterEntity, isFinish: Bool) -> some View {
        VStack(alignment: .leading, spacing: 18) {
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    VStack {
                        HStack(spacing: 4) {
                            Text("D-7")
                                .font(.pretendardB(12))
                                .foregroundStyle(Color(.white))
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 3)
                        .frame(width: 50, height: 20)
                        .background(Color(.mainRed))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        Text(booster.name)
                            .font(.pretendardB(20))
                            .foregroundStyle(Color(.mainBlack))
                    }
                    Spacer()
                    Image(BasterdzImage.fire)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }
            }
            HStack {
                Text("2024.01.11 ~ 2024.02.11")
                    .font(.pretendardB(12))
                    .foregroundStyle(Color(.grey3))
                Spacer()
                Button(action: {
                    viewModel.action(.selectBooster(booster))
                }, label: {
                    Text("발송하기")
                        .font(.pretendardB(14))
                        .foregroundStyle(Color(.mainBlack))
                    Image(BasterdzImage.arrow_right)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                })
            }
        }
        .padding(16)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Color.clear)
                .roundedBorder(Color(.grey2))
                .shadow(color: Color(.grey2), radius: 3, x: 0, y: 2)
        }
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
