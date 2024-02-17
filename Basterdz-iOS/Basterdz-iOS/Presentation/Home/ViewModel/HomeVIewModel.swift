//
//  HomeVIewModel.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2024/02/01.
//

import Foundation

enum HomeFlowPath: String, Hashable {
    case plusButton
    case detail
}

final class HomeViewModel: ObservableObject {
    @Published var path: [HomeFlowPath] = []
}
