//
//  BoosterViewModel.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2024/02/01.
//

import Foundation

enum BoosterFlowPath {
    case selectBoosterReceiver
    case enterMessage
    case pushSuccess
}

final class BoosterViewModel: ObservableObject {
    @Published var path: [BoosterFlowPath] = []
}
