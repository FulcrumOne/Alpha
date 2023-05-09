//
//  InterfaceHelper.swift of Alpha
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

class InterfaceHelper {
    static let marginValue: CGFloat = 16
}

// MARK: - View Extensions
extension View {
    func setFullWidth() -> some View { frame(width: UIScreen.width) }
    func setFullWidthWithoutMargins() -> some View { frame(width: UIScreen.width - 2 * InterfaceHelper.marginValue) }
}
