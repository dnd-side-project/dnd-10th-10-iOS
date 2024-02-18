//
//  HomeView.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2024/02/01.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel
    @State var currentTab: TabItem = .progressRoom
    @State private var plusButtonTap = false
    
    @Namespace var animation
    let columns: [GridItem] = Array(repeating: .init(spacing: 16), count: 4)
    
    enum TabItem: CaseIterable {
        case progressRoom, finishRoom
        
        var title: String {
            switch self {
            case .progressRoom: "참여방"
            case .finishRoom: "종료방"
            }
        }
    }
    
    var body: some View {
        NavigationStack(path: $viewModel.path) {
            VStack {
                BasterdzNavigationBar(
                    leadingItem: (.basterdz, {})
                )
                LazyVStack(pinnedViews: [.sectionHeaders], content: {
                    Section {
                        tabContent(currentTab)
                    } header: {
                        tabBar()
                    }
                })
                Spacer()
                
                HStack {
                    Spacer()
                    Button(action: {
                        plusButtonTap.toggle()
                    }, label: {
                        Image(BasterdzImage.plus)
                            .resizable()
                            .frame(width: 48, height: 48)
                    })
                    .padding(20)
                }
            }
            .fullScreenCover(isPresented: $plusButtonTap) {
                RoomView(coordinator: RoomCoordinator())
            }
        }
       
    }
}

private extension HomeView {
    @ViewBuilder func tabBar() -> some View {
        LazyVGrid(columns: columns, content: {
            ForEach(TabItem.allCases, id: \.title) { tab in
                Text(tab.title)
                    .tag(tab)
                    .font(
                        currentTab == tab ?
                            .pretendardB(24) :.pretendardM(24)
                    
                    )
                    .foregroundStyle(
                        currentTab == tab
                        ? Color(.mainBlack)
                        : Color(.grey3)
                    )
                    .frame(height: 48)
                    .background(Color.white)
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
    @ViewBuilder func tabContent(_ tab: TabItem) -> some View {
        switch tab {
        case .progressRoom:
            emptyTabContent()
    
        case .finishRoom:
            emptyTabContent()
        }
    }
    
    @ViewBuilder func emptyTabContent() -> some View {
        VStack(spacing: 24) {
            Spacer(minLength: 120)
            Image(BasterdzImage.emptyRoom)
                .resizable()
                .scaledToFit()
                .frame(width: 140, height: 140)
                
            Text("아직 참여중인 방이 없어요!".applyVariousFont(targetStringList: ["참여중인 방"], font: .pretendardB(24)))
                .font(.pretendardM(24))
                .foregroundStyle(Color(.mainBlack))
            
            Spacer()
        }
    }
}
#Preview {
    HomeView(viewModel: HomeViewModel())
}
