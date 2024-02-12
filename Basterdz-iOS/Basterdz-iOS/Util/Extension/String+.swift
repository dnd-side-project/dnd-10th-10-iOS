//
//  String+.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2/12/24.
//

import SwiftUI

extension String {
    
    /// 일부 글자만 다른 폰트 적용하는 메서드
    func applyVariousFont(targetStringList: [String], font: Font) -> AttributedString {
        var text = AttributedString(self)
        
        targetStringList.forEach {
            let range = text.range(of: $0)!
            text[range].font = font
        }
        
        return text
    }
}
