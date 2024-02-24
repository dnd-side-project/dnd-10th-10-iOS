//
//  GetRankUseCase.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/24/24.
//

import Foundation
import Combine

final class GetRankUseCase {
    private let network: any RoomNetworkable
    
    init(network: any RoomNetworkable) {
        self.network = network
    }
    
    func execute(id: String) -> AnyPublisher<[RankDTO], ErrorResponse> {
        network.getRank(id: id)
    }
}
