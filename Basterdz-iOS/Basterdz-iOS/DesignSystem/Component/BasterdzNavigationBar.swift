//
//  BasterdzNavigationBar.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/5/24.
//

import SwiftUI

struct BasterdzNavigationBar: View {

    private let leadingTitle: String?
    private let centerTitle: String?
    private let leadingItem: (BasterdzImage, () -> Void)?
    private let trailingItemList: [(BasterdzImage, () -> Void)]?
    
    init(
        leadingTitle: String? = .none,
        centerTitle: String? = .none,
        leadingItem: (BasterdzImage, () -> Void)? = .none,
        trailingItemList: [(BasterdzImage, () -> Void)]? = .none
    ) {
        self.leadingTitle = leadingTitle
        self.centerTitle = centerTitle
        self.leadingItem = leadingItem
        self.trailingItemList = trailingItemList
    }
    
    var body: some View {
        HStack(spacing: 0) {
            if let leadingItem {
                Button(action: {
                    leadingItem.1()
                }, label: {
                    if leadingItem.0 == .basterdz {
                        Image(leadingItem.0)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 48)
                            .frame(maxWidth: 120)
                    } else {
                        Image(leadingItem.0)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                    }
                })
            }
            if let leadingTitle {
                Text(leadingTitle)
                    .font(.pretendardB(24))
                    .foregroundStyle(Color(.mainBlack))
            }
            Spacer()
            if let trailingItemList {
                HStack {
                    ForEach(trailingItemList, id: \.0) { item in
                        Button(action: {
                            item.1()
                        }, label: {
                            Image(item.0)
                                .frame(width: 48, height: 48)
                        })
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .frame(height: 48)
        .frame(maxWidth: .infinity)
        .overlay {
            if let centerTitle {
                Text(centerTitle)
                    .font(.pretendardB(20))
                    .foregroundStyle(Color(.mainBlack))
            }
        }
    }
}
