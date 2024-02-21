//
//  RoomNetworkable.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/21/24.
//

import Foundation

protocol RoomNetworkable {
    func createRoom(member: MemberEntity, roomEntity: RoomEntity)
}
