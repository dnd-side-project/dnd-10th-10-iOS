//
//  MemberEntity.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/21/24.
//

import Foundation

class MemberEntity: Codable {
    let createdAt: String
    let modifiedAt: String
    let id: Int
    let nickname: String
    let oauthId: String
    let oauthProvider: String
}
