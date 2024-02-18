//
//  RestrictAppType.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/5/24.
//

import Foundation

enum RestrictApp: String, CaseIterable {
    case none = "제한 앱을 선택해보세요"
    case instagram = "인스타그램"
    case youtube = "유투브"
    case tictok = "틱톡"
    case netflix = "넷플릭스"
    case twitter = "엑스"
    
    var image: BasterdzImage {
        switch self {
        case .none:
            BasterdzImage.plus
        case .instagram:
            BasterdzImage.instagram
        case .youtube:
            BasterdzImage.youtube
        case .tictok:
            BasterdzImage.tictok
        case .netflix:
            BasterdzImage.netflix
        case .twitter:
            BasterdzImage.twitter
        }
    }
}
