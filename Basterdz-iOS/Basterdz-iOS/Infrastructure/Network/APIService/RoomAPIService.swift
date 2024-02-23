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
    
    func searchRoomAPI<T: Decodable>() -> AnyPublisher<T, ErrorResponse> {
        return provider.request(.searchRoom)
            .tryMap { response in
                try JSONDecoder().decode(CommonResponse<T>.self, from: response.data)
            }
            .tryMap { responseData in
                if let data = responseData.data {
                    return data
                } else if let error = responseData.error {
                    throw error
                } else {
                    throw ErrorResponse.commonError
                }
            }
            .mapError { error in
                if let customError = error as? ErrorResponse {
                    return customError
                } else {
                    return ErrorResponse.commonError
                }
            }
            .eraseToAnyPublisher()
    }
}
