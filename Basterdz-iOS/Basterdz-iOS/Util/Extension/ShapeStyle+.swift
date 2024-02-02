//
//  ShapeStyle+.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2024/02/02.
//

import UIKit
import SwiftUI

extension ShapeStyle where Self == Color {
    
    init(_ customColor: BasterdzColor) {
        self = customColor.color
    }
}
