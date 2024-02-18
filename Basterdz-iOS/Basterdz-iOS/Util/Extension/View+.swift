//
//  View+.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/3/24.
//

import SwiftUI

extension View {
    var scene: UIWindowScene? {
        UIApplication
            .shared
            .connectedScenes
            .first as? UIWindowScene
    }
    
    var window: UIWindow? {
        scene?
            .windows
            .first(where: { $0.isKeyWindow })
    }
    
    var root: UIViewController? {
        window?.rootViewController
    }
    
    var screenSize: CGRect? {
        root?.view.frame
    }
    
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

    @ViewBuilder func hideKeyboardOnTapBackground(background: UIColor = UIColor.systemBackground) -> some View {
        self.background(
            Color(background)
                .onTapGesture {
                    UIApplication.shared.endEditing()
                }
        )
    }
}
