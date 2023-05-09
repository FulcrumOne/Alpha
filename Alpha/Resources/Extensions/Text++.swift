//
//  Text++.swift of Alpha
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

extension Text {
    static func header(_ text: String) -> Text { .init(text)
            .font(.system(size: 20, weight: .semibold))
            .foregroundColor(.onBackgroundPrimary)
    }
}
