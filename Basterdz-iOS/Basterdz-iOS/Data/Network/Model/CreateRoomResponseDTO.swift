//
//  CreateRoomResponseDTO.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/24/24.
//

import Foundation

struct CreateRoomResponseDTO: Decodable {
    let id: Int
    let inviteCode: String
}
