//
//  UIApplication+.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/18/24.
//

import Foundation
import UIKit

public extension UIApplication {
    func endEditing() {
        sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil, from: nil, for: nil
        )
    }
}
