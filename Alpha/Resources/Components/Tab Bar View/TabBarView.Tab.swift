//
//  TabBarView.Tab.swift of Alpha
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

extension TabBarView {
    enum Tab: String, CaseIterable { case rewards, account }
}
extension TabBarView.Tab {
    var icon: IconView.SingleColour {
        switch self {
            case .rewards: return .reward
            case .account: return .profile
        }
    }
    var text: String { rawValue.capitalized }
}
