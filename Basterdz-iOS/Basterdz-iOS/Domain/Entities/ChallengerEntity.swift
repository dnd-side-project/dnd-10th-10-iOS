//
//  ChallengerEntity.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2/22/24.
//

import Foundation

// TODO: 데이터 타입 수정 예정
struct ChallengerEntity: Identifiable {
    let id = UUID()
    let nickname: String
    let message: String
    let screenTime: String
}
