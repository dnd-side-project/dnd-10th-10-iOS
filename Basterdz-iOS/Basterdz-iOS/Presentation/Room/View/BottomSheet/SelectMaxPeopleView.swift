//
//  SelectMaxPeopleView.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/4/24.
//

import SwiftUI

struct SelectMaxPeopleView: View {
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        VStack(spacing: 16){
            Text("참여인원을 설정해주세요.")
            LazyVGrid(columns: columns) {
                ForEach(1..<7) {
                    CommonButton(title: "\($0)인", action: {})
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    SelectMaxPeopleView()
}
