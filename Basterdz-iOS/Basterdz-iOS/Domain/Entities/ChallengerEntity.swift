//
//  ChallengerEntity.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2/22/24.
//

import Foundation

// TODO: 데이터 타입 수정 예정
struct ChallengerEntity: Identifiable, Hashable {
    let id = UUID()
    let nickname: String
    let message: String
    let screenTime: String
    let percent: Double
}

extension ChallengerEntity {
    static let mock = ChallengerEntity(
        nickname: "익명의 바밤바",
        message: "달고달디단 밤양갱",
        screenTime: "",
        percent: 0.0
    )
}
