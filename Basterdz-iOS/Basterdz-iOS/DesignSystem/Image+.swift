//
//  Image+.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/5/24.
//

import SwiftUI

extension Image {
    init(_ imageName: BasterdzImage) {
        self = Image(imageName.rawValue, bundle: nil)
    }
}

enum BasterdzImage: String {
    case arrow_down
}
