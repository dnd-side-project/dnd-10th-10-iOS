//
//  BoosterView.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2024/02/01.
//

import SwiftUI

struct BoosterView: View {
    @StateObject var viewModel: BoosterViewModel
    @EnvironmentObject var coordinator: BoosterCoordinator
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    BasterdzNavigationBar(
                        leadingTitle: "부스터",
                        leadingTitleItem: (BasterdzImage.info, {})
                    )
                    VStack(spacing: 24) {
                        VStack(spacing: 12) {
                            Text("나의 부스터 현황")
                                .font(.pretendardB(16))
                                .foregroundStyle(Color(.mainBlack))
                                .frame(maxWidth: .infinity)
                            
                            HStack {
                                boosterSummeryCell(boosternum: 34, title: "보유 부스터")
                                Divider()
                                    .padding(.horizontal, 8)
                                    .foregroundStyle(Color(.grey3))
                                boosterSummeryCell(boosternum: 20, title: "받은 부스터")
                                Divider()
                                    .padding(.horizontal, 8)
                                    .foregroundStyle(Color(.grey3))
                                boosterSummeryCell(boosternum: 23, title: "보낸 부스터")
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(32)
                        .background(Color(.grey1))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal, 16)
                        
                        HStack(spacing: 4) {
                            Text("참여 중인 방")
                                .font(.pretendardB(20))
                                .foregroundStyle(Color(.mainBlack))
                                .frame(alignment: .leading)
                            Text("\(viewModel.roomList.count)")
                                .font(.pretendardB(20))
                                .foregroundStyle(Color(.mainRed))
                            Spacer()
                        }
                        .padding(.horizontal, 16)
                        .frame(alignment: .leading)
                        
                        LazyVGrid(columns: columns) {
                            ForEach(viewModel.roomList, id: \.self) { room in
                                roomCell(entity: room)
                                    .onTapGesture {
                                        viewModel.action(.selectRoom(room))
                                        coordinator.push(.selectRoom(room))
                                    }
                            }
                        }.padding()
                    }
                }
            }
            .navigationDestination(for: BoosterFlow.self) {
                coordinator.setView($0)
                    .toolbar(.hidden, for: .navigationBar)
                    .toolbar(.hidden, for: .tabBar)
            }
        }
    }
    
    @ViewBuilder func boosterSummeryCell(boosternum: Int, title: String) -> some View {
        VStack {
            Text("\(boosternum)")
                .font(.pretendardM(24))
                .foregroundStyle(Color(.mainBlack))
            
            Text(title)
                .font(.pretendardB(14))
                .foregroundStyle(Color(.grey4))
        }
    }
    
    @ViewBuilder func roomCell(entity: RoomEntity) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            VStack(alignment: .leading) {
                HStack {
                    HStack(spacing: 4) {
                        Text("D-\(entity.period)")
                            .font(.pretendardB(12))
                            .foregroundStyle(Color(.white))
                    }
                    .padding(.horizontal, 7)
                    .padding(.vertical, 3)
                    .background(Color(.mainRed))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(width: 50, height: 20)
                    Spacer()
                    Image(BasterdzImage.arrow_right)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 12, height: 12)
                }
                Text(entity.name)
                    .font(.pretendardB(16))
                    .foregroundStyle(Color(.mainBlack))
                    .frame(width: 105)
                
                HStack {
                    Spacer()
                    Image(BasterdzImage.fire)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }
            }
        }
        .padding(16)
        .roundedBorder(Color(.grey2))
        .aspectRatio(1, contentMode: .fill)
        .clipped()
        
    }
}
