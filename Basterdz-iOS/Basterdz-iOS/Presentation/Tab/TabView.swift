//
//  TabView.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/3/24.
//

import SwiftUI

enum Tab {
    case booster
    case home
    case mypage
}

struct TabbarView: View {
    
    @State var selection = Tab.home
    
    var body: some View {
        TabView(selection: $selection) {
            BoosterView(viewModel: BoosterViewModel(coordinator: BoosterCoordinator()))
                .tabItem {
                    tabItem(image: .booster, title: "부스터")
                }
                .tag(Tab.booster)
            HomeView(viewModel: HomeViewModel(coordinator: HomeCoordinator()))
                .tabItem {
                    tabItem(image: .home, title: "홈")
                }
                .tag(Tab.home)
            MyPageView()
                .tabItem {
                    tabItem(image: .mypage, title: "마이 페이지")
                }
                .font(.headline)
                .accentColor(BasterdzColor.mainBlack.color)
                .tag(Tab.mypage)
        }
    }
    
    @ViewBuilder func tabItem(image: BasterdzImage, title: String) -> some View {
        VStack(spacing: 4) {
            Image(image)
                .resizable()
                .scaledToFit()
                .foregroundStyle(Color(.mainBlack))
                .frame(width: 24, height: 24)
            Text(title)
                .font(.pretendardB(12))
                .foregroundStyle(Color(.mainBlack))
        }
    }
}
