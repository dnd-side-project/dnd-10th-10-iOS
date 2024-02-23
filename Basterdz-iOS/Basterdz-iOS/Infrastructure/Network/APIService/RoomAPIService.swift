//
//  RoomAPIService.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2/23/24.
//

import Foundation

import Combine
import Moya

class RoomAPIService: Requestable {
    
    typealias Endpoint = RoomAPI
    
    private let provider = NetworkProvider<Endpoint>()
    private var cancelable = Set<AnyCancellable>()
    
    // TODO: 타입 부분 dto로 수정
    func searchRoomAPI() -> <ErrorResponse?> {
        return provider.request(.searchRoom)
            .sink(receiveCompletion: { completion in
                
            }, receiveValue: { result in
                result.map(ErrorResponse.self)
            })
    }
}
