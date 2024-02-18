//
//  BasterdzColor.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2024/02/02.
//

import SwiftUI

enum BasterdzColor: String {
    case mainRed
    case mainBlack
    case pink1
    case pink2
    case grey1
    case grey2
    case grey3
    case grey4
    case grey5
    case grey6
    case white
    case red2
    
    var color: Color {
        Color(UIColor(named: rawValue)!)
    }
}
