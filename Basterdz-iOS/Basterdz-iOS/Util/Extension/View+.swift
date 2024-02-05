//
//  View+.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/3/24.
//

import SwiftUI

extension View {
    /// rounded border를 추가하는 extension
    @ViewBuilder func roundedBorder(
        _ color: Color,
        radius: CGFloat = 15,
        linewidth: CGFloat = 1
    ) -> some View {
        self.overlay {
            RoundedRectangle(cornerRadius: radius)
                .stroke(color, lineWidth: linewidth)
        }
    }
}
