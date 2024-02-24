//
//  BasterdzProgressBar.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2/22/24.
//

import SwiftUI

struct BasterdzProgressBar: View {
    
    private let height: CGFloat
    private let width: CGFloat
    private let rate: Double
    private let backgroundColor: BasterdzColor
    private let foregroundColor: BasterdzColor
    
    init(height: CGFloat, 
         width: CGFloat,
         rate: Double,
         backgroundColor: BasterdzColor,
         forgroundColor: BasterdzColor) {
        self.height = height
        self.width = width
        self.rate = rate
        self.backgroundColor = backgroundColor
        self.foregroundColor = forgroundColor
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 29)
                .foregroundColor(Color(backgroundColor))
                .frame(height: height)
            
            RoundedRectangle(cornerRadius: 29)
                .foregroundColor(Color(foregroundColor))
                .frame(width: width * rate, height: height)
        }
    }
}
