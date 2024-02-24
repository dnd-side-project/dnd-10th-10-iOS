//
//  ChallengeRoomView.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2/21/24.
//

import SwiftUI

struct ChallengeRoomView: View {
    @StateObject var viewModel: ChallengeRoomViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack {
                roomHeaderView(room: viewModel.state.room)
                    .padding(.bottom, 31)
                RankingView(rankingList: viewModel.state.rankList)
                MemberListView(dummyData: viewModel.state.challengeList)
                Text("업데이트 시각 : 매일 00시 30분")
                    .font(.pretendardM(12))
                    .foregroundColor(Color(.grey4))
                    .padding(.top, 24)
                    .padding(.bottom, 62)
            }
        }
        .ignoresSafeArea()
        .onAppear {viewModel.action(.getData)}
    }
    
    @ViewBuilder func roomHeaderView(room: GetProgressRoomDTO) -> some View {
        ZStack {
            Image(BasterdzImage.roomBackground)
                .resizable()
                .frame(maxWidth: .infinity)
                .frame(height: 366 * ((screenSize?.height ?? 0) / 812))
            upperContentView(
                period: room.memberCount,
                title: room.title,
                subTitle: room.goal,
                goalTime: room.limitHour,
                restrictApp: RestrictApp(serverString: room.restrictApp)
            )
                .offset(y: 13)
        }
    }
    
    @ViewBuilder func upperContentView(period: Int, title: String, subTitle: String, goalTime: Int, restrictApp: RestrictApp) -> some View {
        VStack {
            BasterdzNavigationBar(
                leadingItem: (BasterdzImage.backButton_white, {
                    viewModel.coordinator?.pop()
                }),
                trailingItemList: [(BasterdzImage.questionMark, {}),
                                   (BasterdzImage.pencil, {}),
                                   (BasterdzImage.setting, {})]
            )
            Spacer()
                .frame(height: 1)
                .padding(.bottom, 6)
            
            ZStack {
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color(.mainRed))
                    .frame(width: 50, height: 20)
                
                Text("D-\(period)")
                    .font(.pretendardB(12))
                    .foregroundStyle(Color(.grey1))
            }
            
            Text(title)
                .font(.pretendardM(24))
                .foregroundColor(Color(.white))
                .padding(.bottom, 8)
            
            Text(subTitle)
                .foregroundColor(Color(.grey3))
                .font(.pretendardM(13))
                .padding(.bottom, 20)
            
            HStack(spacing: 10) {
                ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .fill(Color(.grey6))
                        .frame(width: 100, height: 30)
                    Text(restrictApp.rawValue)
                        .font(.pretendardB(12))
                        .foregroundStyle(Color(.grey1))
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .fill(Color(.grey6))
                        .frame(width: 70, height: 30)
                    Text("\(goalTime)시간")
                        .font(.pretendardB(12))
                        .foregroundStyle(Color(.grey1))
                }
            }
            .padding(.bottom, 22)
            
            ProgressView()
        }
    }
}

struct MemberListItemView: View {
    private let nickname: String
    private let message: String
    private let screenTime: String
    private let strokeColor: BasterdzColor
    private let percent: Double
    
    init(nickname: String, message: String, screenTime: String, strokeColor: BasterdzColor, percent: Double) {
        self.nickname = nickname
        self.message = message
        self.screenTime = screenTime
        self.strokeColor = strokeColor
        self.percent = percent
    }
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(strokeColor), lineWidth: 1)
                .frame(height: 107)
                .padding(.leading, 24)
                .padding(.trailing, 24)
                .foregroundColor(.white)
            
            HStack(spacing: 35) {
                VStack(spacing: 2) {
                    Image(BasterdzImage.bombLevel1)
                    Text(nickname)
                        .font(.pretendardB(12))
                        .foregroundStyle(Color(.mainBlack))
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text(message)
                        .font(.pretendardM(12))
                        .foregroundStyle(Color(.mainBlack))
                        .padding(.bottom, 3)
                    
                    Text(screenTime)
                        .font(.pretendardR(32))
                        .foregroundStyle(Color(.mainBlack))
                        .padding(.bottom, 6)
                    
                    HStack(spacing: 5) {
                        BasterdzProgressBar(height: 5,
                                            width: 175,
                                            rate: percent,
                                            backgroundColor: .grey2,
                                            forgroundColor: .mainBlack)
                        .frame(width: 175)
                        
                        Image(BasterdzImage.spark)
                            .frame(width: 10, height: 10)
                    }
                }
            }
        }
    }
}


struct RankingView: View {
    private let rankingList: [RankDTO]
    
    init(rankingList: [RankDTO]) {
        self.rankingList = rankingList
    }
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    // TODO: 이전 날짜로 이동
                } label: {
                    Image(BasterdzImage.backButtonGrey)
                }
                .padding(.trailing, 10)
                
                Text("2월 1일 랭킹")
                    .font(.pretendardB(20))
                
                Image(BasterdzImage.calendar_enabled)
                
                Button {
                    // TODO: 이전 날짜로 이동
                } label: {
                    Image(BasterdzImage.nextButtonGrey)
                }
                .padding(.leading, 10)
            }
            .padding(.bottom, 27)
            
            if rankingList.isEmpty {
                EmptyChartView()
                    .padding(.bottom, 30)
            } else {
                ForEach(rankingList, id: \.ranking) { item in
                    HStack {
                        Text("\(item.ranking)위")
                            .font(.pretendardB(24))
                        Text(item.nickname)
                            .font(.pretendardB(16))
                    }
                }
            }
            Rectangle()
                .foregroundColor(Color(.grey1))
                .frame(height: 2)
                .padding(.bottom, 40)
        }
    }
}

struct MemberListView: View {
    
    private let dummyData: [ChallengerEntity]
    
    init(dummyData: [ChallengerEntity]) {
        self.dummyData = dummyData
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("참여 중인 바스터즈")
                    .font(.pretendardB(20))
                    .foregroundStyle(Color(.mainBlack))
                Spacer()
            }
            .padding(.leading, 24)
            .padding(.bottom, 16)
            
            ForEach(dummyData) { data in
                MemberListItemView(nickname: data.nickname,
                                   message: data.message,
                                   screenTime: data.screenTime,
                                   strokeColor: .mainRed,
                                   percent: data.percent
                )
                    .padding(.bottom, 16)
            }
        }
    }
}

struct EmptyChartView: View {
    
    var body: some View {
        VStack(spacing: 8) {
            Image(BasterdzImage.bombWithMedal)
                .frame(width: 100, height: 100)
            Text("아직 랭킹이 만들어지지 않았어요!"
                .applyVariousFont(targetStringList: ["랭킹"],
                                  font: .pretendardB(16)))
            .font(.pretendardM(16))
            .foregroundStyle(Color(.mainBlack))
        }
    }
}

struct ProgressView: View {
    private var startDate: String = "1월 23일"
    private var endDate: String = "2월 20일"
    private var currentDate: String = "2월 2일"
    
    var body: some View {
        VStack {
            ZStack {
                // TODO: 말풍선 Position 지정 계산 추가 필요
                Image(BasterdzImage.bubble)
                Text(currentDate)
                    .font(.pretendardM(11))
                    .offset(y: -2)
            }
            
            BasterdzProgressBar(height: 4,
                                width: (screenSize?.width ?? 0) - 52,
                                rate: 0.5,
                                backgroundColor: .grey4,
                                forgroundColor: .mainRed)
            .padding(.leading, 26)
            .padding(.trailing, 26)
            .padding(.bottom, 9)
            
            HStack {
                Text(startDate)
                    .font(.pretendardM(12))
                    .foregroundStyle(Color(.grey3))
                Spacer()
                Text(endDate)
                    .font(.pretendardM(12))
                    .foregroundStyle(Color(.grey3))
            }
            .padding(.leading, 26)
            .padding(.trailing, 26)
        }
    }
}


