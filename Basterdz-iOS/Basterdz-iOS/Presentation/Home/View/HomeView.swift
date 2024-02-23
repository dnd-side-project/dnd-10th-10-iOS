//
//  HomeView.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/17/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    
    @State private var currentTab: TabItem = .progressRoom
    @State private var plusButtonTap = false
    
    @Namespace private var animation
    private let columns: [GridItem] = Array(repeating: .init(spacing: 16), count: 4)
    private let chipRows = [GridItem(.flexible(maximum: 100))]
    
    enum TabItem: CaseIterable {
        case progressRoom, finishRoom
        
        var title: String {
            switch self {
            case .progressRoom: "참여방"
            case .finishRoom: "종료방"
            }
        }
    }
    
    init(viewModel: HomeViewModel) {
        self._viewModel = .init(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(spacing: 16) {
            BasterdzNavigationBar(
                leadingItem: (.basterdz, {})
            )
            ZStack {
                VStack {
                    tabBar()
                    ScrollView {
                        tabContent(currentTab)
                    }
                    .frame(maxHeight: .infinity)
                }
                HStack {
                    Spacer()
                    Button(action: {
                        plusButtonTap.toggle()
                    }, label: {
                        Image(BasterdzImage.plus)
                            .resizable()
                            .frame(width: 50, height: 50)
                    })
                    .padding(20)
                }
                .offset(y: (self.screenSize?.height ?? 100) * 0.35 )
            }
        }
        .fullScreenCover(isPresented: $plusButtonTap) {
            RoomView(coordinator: RoomCoordinator())
        }
        .onAppear {viewModel.action(.getDatas)}
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
            if viewModel.state.progressRoomList.isEmpty {
                emptyTabContent()
            } else {
                roomTabContent(list: viewModel.state.progressRoomList, isFinish: false)
            }
        case .finishRoom:
            if viewModel.state.finishRoomList.isEmpty {
                emptyTabContent()
            } else {
                roomTabContent(list: viewModel.state.finishRoomList, isFinish: true)
            }
        }
    }
    
    @ViewBuilder func roomTabContent(list: [RoomEntity], isFinish: Bool) -> some View {
        // TODO: api 오는 형태보고 id 변경 필요
        // header
        VStack {
            ScrollView(.horizontal) {
                LazyHGrid(rows: chipRows, spacing: 4) {
                    ForEach(RestrictApp.allCases, id: \.self) { item in
                        if item == .none {
                            BasterdzChipButton(title: "전체") {
                                viewModel.action(.chipButtonTap(item))
                            }
                        } else {
                            BasterdzChipButton(title: item.rawValue, image: item.image) {
                                viewModel.action(.chipButtonTap(item))
                            }
                        }
                    }
                }
                .padding(.horizontal, 16)
                .frame(height: 40)
            }
            .scrollIndicators(.never)
            
            HStack {
                Text("\(list.count)개".applyVariousFont(targetStringList: ["\(list.count)"], font: .pretendardB(14)))
                    .font(.pretendardM(14))
                    .foregroundStyle(Color(.grey6))
                
                Spacer()
                Button(action: {}, label: {
                    Text("최신순")
                        .font(.pretendardM(13))
                        .foregroundStyle(Color(.grey5))
                    Image(BasterdzImage.arrow_down)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 14, height: 14)
                        .foregroundStyle(Color(.grey4))
                })
            }
            .padding(16)
            // 리스트
            ForEach(list, id: \.name) { room in
                roomItem(room: room, isFinish: isFinish)
                    .onTapGesture {
                        viewModel.action(.roomTap(room))
                    }
            }.padding(.horizontal, 16)
        }
    }
    
    @ViewBuilder func roomItem(room: RoomEntity, isFinish: Bool) -> some View {
        VStack(alignment: .leading, spacing: 18) {
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    HStack(spacing: 4) {
                        Text("D-\(room.period)")
                            .font(.pretendardB(12))
                            .foregroundStyle(Color(.white))
                    }
                    .padding(.horizontal, 7)
                    .padding(.vertical, 3)
                    .background(Color(.mainRed))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(width: 50, height: 20)
                    
                    BasterdzChipButton(
                        title: room.restrictAppType.rawValue,
                        image: room.restrictAppType.image,
                        size: .small
                    )
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
                Image(BasterdzImage.person)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18)
                Text("\(room.currentPeople)/\(room.maxPeople)")
                    .font(.pretendardM(13))
                    .foregroundStyle(Color(.mainBlack))
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
            
            Text("아직 참여중인 방이 없어요!".applyVariousFont(targetStringList: ["참여중인 방"], font: .pretendardB(24)))
                .font(.pretendardM(24))
                .foregroundStyle(Color(.mainBlack))
            Spacer()
        }
        .frame(maxHeight: .infinity)
    }
}
