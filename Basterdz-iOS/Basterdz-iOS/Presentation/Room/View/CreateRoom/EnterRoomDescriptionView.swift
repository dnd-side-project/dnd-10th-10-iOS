//
//  EnterRoomDescriptionView.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/3/24.
//

import SwiftUI

struct EnterRoomDescriptionView: View {
    
    @ObservedObject var viewModel: EnterRoomDescriptionViewModel
    @FocusState var focusState: FocusItem?
    
    enum FocusItem {
        case goal, restrictApp, time, restrictTime, maxPeopleCount
    }
    
    init(viewModel: EnterRoomDescriptionViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            BasterdzNavigationBar(
                centerTitle: "방만들기",
                leadingItem: (BasterdzImage.arrow_back, {
                    viewModel.coordinator?.pop()
                })
            )
            VStack(spacing: 16) {
                // MARK: 1번 목표 한마디
                numberView(
                    number: 1,
                    title: "목표 한마디",
                    isActive: viewModel.state.isGoalButtonActive
                )
                BasterdzTextField(
                    text: $viewModel.state.roomEntity.goal,
                    isActive: focusState != .goal && !viewModel.state.isGoalButtonActive,
                    isFocused: $focusState,
                    focusValue: .goal,
                    placeholder: "도전하는 목표를 작성해보세요",
                    trailingText: "\(viewModel.state.roomEntity.goal.count)/20",
                    errorMessage: viewModel.state.goalErrorMessage
                )
                .focused($focusState, equals: .goal)
                
                // MARK: 2번 제한 앱 설정
                numberView(
                    number: 2,
                    title: "제한 앱 설정",
                    isActive: viewModel.state.isRestrictAppButtonActive)
                
                BasterdzOptionButton(
                    isActive: !viewModel.state.isRestrictAppButtonActive,
                    action: {
                        viewModel.action(.restrictAppModalButtonTap)
                    },
                    label: viewModel.state.roomEntity.restrictAppType.rawValue
                )
                .focused($focusState, equals: .restrictApp)
                
                // MARK: 3번 스크린 타임 제한 기간 설정
                VStack {
                    numberView(
                        number: 3,
                        title: "스크린 타임 제한 기간 설정",
                        isActive: viewModel.state.isPeriodButtonActive
                    )
                    BasterdzOptionButton(
                        isActive: !viewModel.state.isPeriodButtonActive,
                        action: {
                            viewModel.action(.periodModalButtonTap)
                        },
                        label: viewModel.state.roomEntity.period != 0  ? "\(viewModel.state.roomEntity.period)일" : "디데이 기간을 설정해보세요",
                        image: BasterdzImage.calendar.rawValue
                    )
                    .focused($focusState, equals: .restrictTime)
                    
                }
                
                // MARK: 4번 하루 총 제한 시간
                HStack {
                    numberView(
                        number: 4,
                        title: "하루 총 제한 시간",
                        isActive: viewModel.state.isRestrictTimeButtonActive
                    )
                    BasterdzOptionButton(
                        isActive: !viewModel.state.isRestrictTimeButtonActive,
                        action: {
                            viewModel.action(.restrictTimeModalButtonTap)
                        },
                        label: viewModel.state.roomEntity.restrictAppTime == 0 ? "":
                            "\(viewModel.state.roomEntity.restrictAppTime)시간"
                    )
                    .frame(width: 124)
                }
                .focused($focusState, equals: .restrictTime)
                
                // MARK: 5번 참여 정원
                HStack {
                    numberView(
                        number: 5,
                        title: "참여 정원",
                        subtitle: "최대 6명",
                        isActive: viewModel.state.isMaxPeopleButtonActive
                    )
                    BasterdzOptionButton(
                        isActive: !viewModel.state.isMaxPeopleButtonActive,
                        action: {
                            viewModel.action(.maxPeopleModalButtonTap)
                        },
                        label: viewModel.state.roomEntity.maxPeople == 0 ? "" :
                            "\(viewModel.state.roomEntity.maxPeople)명"
                    )
                    .frame(width: 124)
                }
                .focused($focusState, equals: .maxPeopleCount)
                
                Spacer()
                BasterdzCommonButton(
                    title: "방 생성하기",
                    style: .red,
                    action: {
                        viewModel.action(.bottomButtonTap)
                    },
                    isActive: viewModel.state.isBottomButtonActive
                )
            }.padding(.horizontal, 16)
        }
        .sheet(isPresented: $viewModel.state.showModal, content: {
            showModalContent()
                .presentationDetents(
                    [.height(UIScreen.main.bounds.height * 0.5)]
                )
        })
        .onAppear {
            focusState = .goal
        }
        .hideKeyboardOnTapBackground()
    }
    
    // modal 보여주는 뷰
    @ViewBuilder func showModalContent() -> some View {
        switch viewModel.state.showContent {
        case .restrictApp:
            SelectRestrictAppBottomView(viewModel: viewModel, showModal: $viewModel.state.showModal)
        case .restrictTime:
            SelectRestrictTimeBottomView(viewModel: viewModel, showModal: $viewModel.state.showModal)
        case .maxPeople:
            SelectMaxPeopleBottomView(viewModel: viewModel, showModal: $viewModel.state.showModal)
        case .period:
            SelectPeriodBottomView(viewModel: viewModel, showModal: $viewModel.state.showModal)
        }
    }
    
    // number 뷰
    @ViewBuilder func numberView(
        number: Int,
        title: String,
        subtitle: String? = nil,
        isActive: Bool
    ) -> some View {
        HStack {
            Circle()
                .foregroundStyle(
                    isActive ?
                    Color(.red) :
                        Color(.grey2)
                )
                .opacity(0.8)
                .frame(width: 24, height: 24)
                .overlay(alignment: .center) {
                    Text("\(number)")
                        .font(.pretendardB(14))
                        .foregroundStyle(Color(.white))
                }
                .frame(width: 24, height: 24)
            
            Text(title)
                .font(.pretendardB(16))
                .foregroundStyle(
                    isActive ?
                    Color(.mainBlack) :
                        Color(.grey3)
                )
            if let subtitle {
                Text(subtitle)
                    .font(.pretendardB(13))
                    .foregroundStyle(
                        isActive ?
                        Color(.mainBlack) :
                            Color(.grey3)
                    )
            }
            Spacer()
        }
    }
}
