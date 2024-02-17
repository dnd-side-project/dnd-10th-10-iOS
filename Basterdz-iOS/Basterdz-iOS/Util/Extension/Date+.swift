//
//  Date+.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/17/24.
//

import Foundation

extension Date {
    
    /// timestamp를 날짜로 변경하는 메소드
    var toDateFormmated: String {
        let date = Date.init(timeIntervalSince1970: self.timeIntervalSince1970)
        let dateFormatt = DateFormatter()
        dateFormatt.dateFormat = "YYYY-MM-dd"
        
        return dateFormatt.string(from: date)
    }
}
