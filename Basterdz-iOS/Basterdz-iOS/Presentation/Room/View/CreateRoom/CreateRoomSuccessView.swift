//
//  CreateRoomSuccessView.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/17/24.
//

import SwiftUI

struct CreateRoomSuccessView: View {
    @StateObject var viewModel: CreateRoomViewModel
    
    var body: some View {
        VStack {
            Spacer()
            Text("새로운 방이 생성되었어요!"
                .applyVariousFont(
                    targetStringList: ["새로운 방"],
                    font: .pretendardB(24))
            )
            .font(.pretendardB(20))
            .foregroundStyle(Color(.white))
            
            Image.init(BasterdzImage.createRoomSuccess)
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 80)
            
            Text(viewModel.roomEntity.name)
                .font(.pretendardM(24))
                .foregroundStyle(Color(.white))
            Text(viewModel.roomEntity.goal)
                .font(.pretendardM(13))
                .foregroundStyle(Color(.grey1))
            
            HStack {
                HStack {
                    Image(viewModel.roomEntity.restrictAppType.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                    
                    Text(viewModel.roomEntity.restrictAppType.rawValue)
                        .font(.pretendardM(13))
                        .foregroundStyle(Color(.grey1))
                }
                .padding(10)
                .background(Color(.grey6))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .frame(height: 30)
                
                Text("\(viewModel.roomEntity.restrictAppTime)시간")
                    .font(.pretendardM(13))
                    .foregroundStyle(Color(.grey1))
                    .padding(10)
                    .background(Color(.grey6))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(height: 30)
            }
            Spacer()
        }.background(Color(.mainBlack))
    }
}
