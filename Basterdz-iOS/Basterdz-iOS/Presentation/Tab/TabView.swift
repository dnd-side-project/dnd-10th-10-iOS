//
//  TabView.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/3/24.
//

import SwiftUI

struct TabbarView: View {
    
    var body: some View {
        TabView {
            HomeView(viewModel: HomeViewModel())
                .tabItem {
                    tabItem(image: .home, title: "홈")
                }
            RoomView(viewModel: RoomViewModel())
                .tabItem {
                    VStack(spacing: 4) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 48, height: 48)
                            .background(Color.red)
                            .foregroundStyle(Color(.mainBlack))
                        Text("방만들기")
                            .font(.pretendardB(12))
                            .foregroundStyle(Color(.mainBlack))
                    }
                }
            BoosterView(viewModel: BoosterViewModel())
                .tabItem {
                    tabItem(image: .booster, title: "부스터")
                }
        }
        .font(.headline)
        .accentColor(BasterdzColor.mainBlack.color)
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
