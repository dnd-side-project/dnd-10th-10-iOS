//
//  ScreenTimeDTO.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/24/24.
//

import Foundation

struct ScreenTimeDTO: Decodable {
    let memberId: Int
    let nickName: String
    let usageTime: String
    let percent: Double
    let isExceed: Bool
}
