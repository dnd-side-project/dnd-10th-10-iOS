//
//  RoomAPIService.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2/23/24.
//

import Foundation

import Combine
import Moya

class APIService<API: BaseAPI>: Requestable {

    let provider = NetworkProvider<API>()
    var cancelable = Set<AnyCancellable>()
    
    func mapAPIResponse<T: Decodable>(api: API) -> AnyPublisher<T, ErrorResponse> {
        return provider.request(api)
            .tryMap { response in
                print("decode 시작 \(response)")
                let commonResponse = try JSONDecoder().decode(CommonResponse<T>.self, from: response.data)
                if let data = commonResponse.data {
                    return data
                } else if let error = commonResponse.error {
                    throw error
                } else {
                    throw ErrorResponse.commonError
                }
            }
            .mapError { error in
                print("error: \(error)")
                if let customError = error as? ErrorResponse {
                    return customError
                } else {
                    return ErrorResponse.commonError
                }
            }
            .eraseToAnyPublisher()
    }
}
