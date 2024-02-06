//
//  Image+.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/5/24.
//

import SwiftUI

extension Image {
    init(_ imageName: BasterdzImage) {
        self = Image(imageName.rawValue, bundle: nil)
    }
}

enum BasterdzImage: String {
    // icon
    case arrow_down
    case arrow_back
    case mypage
    case home
    case plus
    case booster
    case calendar
    
    // image
    case createRoom
    case enterInviteCode
    case basterdz
}
