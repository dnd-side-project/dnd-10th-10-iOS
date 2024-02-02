//
//  Font+.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2024/02/01.
//

import SwiftUI

extension Font {
    
    static func pretendardR(_ size: CGFloat) -> Font {
        return Font.custom("Pretendard-Regular", size: size)
    }
    
    static func pretendardM(_ size: CGFloat) -> Font {
        return Font.custom("Pretendard-Medium", size: size)
    }
    
    static func pretendardB(_ size: CGFloat) -> Font {
        return Font.custom("Pretendard-Bold", size: size)
    }
}
