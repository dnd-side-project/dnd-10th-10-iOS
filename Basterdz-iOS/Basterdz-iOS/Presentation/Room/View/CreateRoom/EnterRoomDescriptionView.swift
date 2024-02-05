//
//  EnterRoomDescriptionView.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/3/24.
//

import SwiftUI

struct EnterRoomDescriptionView: View {
    
    @ObservedObject var viewModel: RoomViewModel
    @FocusState var focusState: FocusItem?
    @State var showModal: Bool = false
    @State var showContent: BottomSheetContent = .restrictApp
    
    enum FocusItem {
        case goal, restrictApp, time, restrictTime, maxPeopleCount
    }
    
    enum BottomSheetContent {
        case restrictApp, restrictTime, maxPeople
    }
    
    init(viewModel: RoomViewModel) {
        self.viewModel = viewModel
        self.focusState = .goal
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                numberView(
                    number: 1,
                    title: "목표 한마디",
                    isActive: false
                )
                TextInputView(
                    text: $viewModel.roomEntity.goal,
                    isFocused: $focusState,
                    focusValue: .goal,
                    placeholder: "도전하는 목표를 작성해보세요",
                    trailingText: "\(viewModel.roomEntity.goal.count)/20"
                )
                
                numberView(number: 2, title: "제한 앱 설정", isActive: false)
                
                InputButton(isActive: false, action: {
                    showModal.toggle()
                    showContent = .restrictApp
                }, label: "인스타그램")
                
                
                numberView(number: 3, title: "기간을 설정해주세요", isActive: false)
                // TODO
                
                HStack {
                    numberView(
                        number: 4,
                        title: "하루 총 제한 시간",
                        isActive: false
                    )
                    InputButton(isActive: false, action: {
                        showModal.toggle()
                        showContent = .restrictTime
                    }, label: "1시간")
                        .frame(width: 124)
                }
                HStack {
                    numberView(
                        number: 5,
                        title: "참여 정원",
                        subtitle: "최대 6명",
                        isActive: false
                    )
                    InputButton(isActive: false, action: {
                        showModal.toggle()
                        showContent = .maxPeople
                    }, label: "1명")
                        .frame(width: 124)
                }
            }
            .padding(20)
        }
        .sheet(isPresented: $showModal, content: {
            showModalContent()
                .presentationDetents(
                    [.height(UIScreen.main.bounds.height * 0.4)]
                )
        })
        
    }
   
    
    @ViewBuilder func showModalContent() -> some View {
        switch showContent {
        case .restrictApp:
            SelectRestrictAppView()
        case .restrictTime:
            SelectRestrictTimeView()
        case .maxPeople:
            SelectMaxPeopleView()
        }
    }
    
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
    EnterRoomDescriptionView(viewModel: RoomViewModel())
}
