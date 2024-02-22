//
//  ChallengeRoomView.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2/21/24.
//

import SwiftUI

struct ChallengeRoomView: View {
    
    var body: some View {
        ScrollView {
            VStack {
                RoomHeaderView()
                    .padding(.bottom, 31)
                RankingView()
                MemberListView(dummyData: [
                    ChallengerEntity(nickname: "바밤바",
                               message: "오늘 디지털 디톡스 1등이시네요! :)",
                               screenTime: "02:40"),
                    ChallengerEntity(nickname: "하이",
                               message: "할 수 있어요! 조금 더 분발해봅시다~!",
                               screenTime: "02:40"),
                    ChallengerEntity(nickname: "은주",
                               message: "부스터 조심하세요!!!!",
                               screenTime: "02:40")
                ])
                Text("업데이트 시각 : 매일 00시 30분")
                    .font(.pretendardM(12))
                    .foregroundColor(Color(.grey4))
                    .padding(.top, 24)
                    .padding(.bottom, 62)
            }
        }
        .ignoresSafeArea()
    }
}

struct MemberListItemView: View {
    private let nickname: String
    private let message: String
    private let screenTime: String
    private let strokeColor: BasterdzColor
    
    init(nickname: String,
         message: String,
         screenTime: String,
         strokeColor: BasterdzColor) {
        self.nickname = nickname
        self.message = message
        self.screenTime = screenTime
        self.strokeColor = strokeColor
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
                                            rate: 0.5,
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

struct RoomHeaderView: View {
    
    var body: some View {
        ZStack {
            Image(BasterdzImage.roomBackground)
                .resizable()
                .frame(maxWidth: .infinity)
                .frame(height: 366 * ((screenSize?.height ?? 0) / 812))
            UpperContentView()
                .offset(y: 13)
        }
    }
}

struct RankingView: View {
    
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
            
            EmptyChartView()
                .padding(.bottom, 30)
            
            Rectangle()
                .foregroundColor(Color(.grey1))
                .frame(width: .infinity, height: 2)
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
                                   strokeColor: .mainRed)
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

struct UpperContentView: View {
    private var period: Int = 0
    private var title: String = "우리들의 도파민 탈출기"
    private var subTitle: String = "도파민 중독 파괴하자~!"
    private var goalTime: Int = 0
    private var restrictApp: RestrictApp = .instagram
    
    var body: some View {
        
        VStack {
            BasterdzNavigationBar(
                leadingItem: (BasterdzImage.backButton_white, {
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
