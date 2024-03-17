//
//  BoosterEntity.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/24/24.
//

import Foundation

// TODO: 추후 수정 예정
class BoosterEntity {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

extension BoosterEntity {
    static let mocks = [
        BoosterEntity(name: "부스터1"),
        BoosterEntity(name: "부스터2"),
        BoosterEntity(name: "부스터3")
    ]
}

extension BoosterEntity: Hashable {
    static func == (lhs: BoosterEntity, rhs: BoosterEntity) -> Bool {
        lhs.name == rhs.name
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
}
