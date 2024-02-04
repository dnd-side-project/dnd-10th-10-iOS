//
//  SelectRestrictAppView.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/4/24.
//

import SwiftUI

struct SelectRestrictAppView: View {
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    var body: some View {
        VStack(spacing: 16){
            Text("제한 앱 설정")
            LazyVGrid(columns: columns) {
                ForEach(RestrictAppType.allCases, id: \.self) {
                    CommonButton(title: $0.rawValue, action: {})
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    SelectRestrictAppView()
}
