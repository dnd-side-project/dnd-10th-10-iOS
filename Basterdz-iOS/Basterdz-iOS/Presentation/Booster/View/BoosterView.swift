//
//  BoosterView.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2024/02/01.
//

import SwiftUI

struct BoosterView: View {
    @StateObject var viewModel: BoosterViewModel
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    let list = RoomEntity.mocks
    
    var body: some View {
        NavigationStack(path: $viewModel.path) {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    BasterdzNavigationBar(
                        leadingTitle: "부스터"
                    )
                    VStack(spacing: 24) {
                        Text("나의 부스터 현황")
                            .font(.pretendardB(16))
                            .foregroundStyle(Color(.mainBlack))
                        
                        HStack {
                            boosterSummeryCell(boosternum: 34, title: "보유 부스터")
                            Divider()
                            boosterSummeryCell(boosternum: 20, title: "받은 부스터")
                            Divider()
                            boosterSummeryCell(boosternum: 23, title: "보낸 부스터")
                        }
                        .padding(32)
                        .background(Color(.grey1))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        HStack(spacing: 4) {
                            Text("참여 중인 방")
                                .font(.pretendardB(20))
                                .foregroundStyle(Color(.mainBlack))
                                .frame(alignment: .leading)
                            Text("4")
                                .font(.pretendardB(20))
                                .foregroundStyle(Color(.mainRed))
                            Spacer()
                        }
                        .padding(.horizontal, 16)
                        .frame(alignment: .leading)
                        
                        LazyVGrid(columns: columns) {
                            ForEach(list, id: \.self) {
                                roomCell(entity: $0)
                            }
                        }.padding()
                    }
                }
            }
            .navigationDestination(for: BoosterFlowPath.self) { _ in
                EmptyView()
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
                    .padding(.vertical , 3)
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
        .roundedBorder(Color(.grey1))
    }
}

#Preview {
    BoosterView(viewModel: BoosterViewModel())
}
