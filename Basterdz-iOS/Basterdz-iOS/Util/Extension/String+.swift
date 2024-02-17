//
//  String+.swift
//  Basterdz-iOS
//
//

import Foundation
import SwiftUI

extension String {
    var isNotEmpty: Bool {
        return !(self.isEmpty)
    }

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
