//
//  RankDTO.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/24/24.
//

import Foundation

struct RankDTO: Decodable {
    let ranking: Int
    let nickname: String
    let usageTime: String
}
