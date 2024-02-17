//
//  EnterRoomDescriptionView.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/3/24.
//

import SwiftUI

struct EnterRoomDescriptionView: View {
    
    @ObservedObject var viewModel: CreateRoomViewModel
    @FocusState var focusState: FocusItem?
    @State var showModal: Bool = false
    @State var showContent: BottomSheetContent = .restrictApp
    
    enum FocusItem {
        case goal, restrictApp, time, restrictTime, maxPeopleCount
    }
    
    enum BottomSheetContent {
        case restrictApp, endTime, restrictTime, maxPeople
    }
    
    init(viewModel: CreateRoomViewModel) {
        self.viewModel = viewModel
        self.focusState = .goal
    }
    
    var body: some View {
        VStack {
            BasterdzNavigationBar(
                centerTitle: "방만들기",
                leadingItem: (BasterdzImage.arrow_back, {
                    viewModel.path.removeLast()
                })
            )
            VStack(spacing: 16) {
                // MARK: 1번 목표 한마디
                numberView(
                    number: 1,
                    title: "목표 한마디",
                    isActive: viewModel.roomEntity.goal.isNotEmpty
                )
                BasterdzTextField(
                    text: $viewModel.roomEntity.goal,
                    isActive: focusState != .goal && viewModel.roomEntity.goal.isNotEmpty,
                    isFocused: $focusState,
                    focusValue: .goal,
                    placeholder: "도전하는 목표를 작성해보세요",
                    trailingText: "\(viewModel.roomEntity.goal.count)/20",
                    errorMessage: viewModel.goalErrorMessage
                )
                .focused($focusState, equals: .goal)
                
                // MARK: 2번 제한 앱 설정
                numberView(number: 2, title: "제한 앱 설정", isActive: viewModel.roomEntity.restrictAppType != .none)
                
                BasterdzOptionButton(
                    isActive: viewModel.roomEntity.restrictAppType == .none,
                    action: {
                        showContent = .restrictApp
                        showModal = true
                    },
                    label: viewModel.roomEntity.restrictAppType.rawValue
                )
                .focused($focusState, equals: .restrictApp)
                
                // MARK: 3번 스크린 타임 제한 기간 설정
                VStack {
                    numberView(
                        number: 3,
                        title: "스크린 타임 제한 기간 설정",
                        isActive: viewModel.roomEntity.endTimeStamp > Date()
                    )
                    BasterdzOptionButton(
                        isActive: viewModel.roomEntity.endTimeStamp > Date(),
                        action: {
                            showContent = .endTime
                            showModal = true
                        },
                        label: viewModel.roomEntity.endTimeStamp > Date() ? viewModel.roomEntity.endTimeStamp.toDateFormmated : "종료일을 설정해보세요",
                        image: BasterdzImage.calendar.rawValue
                    )
                    .focused($focusState, equals: .restrictTime)
                    
                }
                
                // MARK: 4번 하루 총 제한 시간
                HStack {
                    numberView(
                        number: 4,
                        title: "하루 총 제한 시간",
                        isActive: viewModel.roomEntity.restrictAppTime != 0
                    )
                    BasterdzOptionButton(
                        isActive: viewModel.roomEntity.restrictAppTime == 0,
                        action: {
                            showContent = .restrictTime
                            showModal = true
                        },
                        label: viewModel.roomEntity.restrictAppTime == 0 ? "":
                            "\(viewModel.roomEntity.restrictAppTime)시간"
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
                        isActive: viewModel.roomEntity.maxPeople != 0
                    )
                    BasterdzOptionButton(
                        isActive: viewModel.roomEntity.maxPeople == 0,
                        action: {
                            showContent = .maxPeople
                            showModal = true
                        }, label: viewModel.roomEntity.maxPeople == 0 ? "" :
                            "\(viewModel.roomEntity.maxPeople)명"
                    )
                    .frame(width: 124)
                }
                .focused($focusState, equals: .maxPeopleCount)
                
                Spacer()
                
                BasterdzCommonButton(
                    title: "방 생성하기",
                    style: .red,
                    action: {
                        viewModel.reduce(.roomDescriptionButtonTap)
                    },
                    isActive: viewModel.isCreateRoomButtonActive
                )
            }.padding(.horizontal, 16)
        }
        .sheet(isPresented: $showModal, content: {
            showModalContent()
                .presentationDetents(
                    [.height(UIScreen.main.bounds.height * 0.5)]
                )
        })
    }
    
    // modal 보여주는 뷰
    @ViewBuilder func showModalContent() -> some View {
        switch showContent {
        case .restrictApp:
            SelectRestrictAppBottomView(viewModel: viewModel, showModal: $showModal)
        case .restrictTime:
            SelectRestrictTimeBottomView(viewModel: viewModel, showModal: $showModal)
        case .maxPeople:
            SelectMaxPeopleBottomView(viewModel: viewModel, showModal: $showModal)
        case .endTime:
            SelectEndDateBottomView(viewModel: viewModel, showModal: $showModal)
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

#Preview {
    EnterRoomDescriptionView(viewModel: CreateRoomViewModel())
}
