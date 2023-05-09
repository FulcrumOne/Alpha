//
//  View++.swift of Alpha
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

// MARK: - To Allow Configurable Constructions
extension View {
    @inlinable func then(_ body: (inout Self) -> Void) -> Self {
        var result = self
        body(&result)
        return result
    }
}

// MARK: - To Maintain Code Consistency
extension View {
    func frame(_ size: CGFloat) -> some View { frame(width: size, height: size, alignment: .center) }
}

// MARK: - Alignments
extension View {
    func alignToBottom(_ value: CGFloat = 0) -> some View {
        VStack(spacing: 0) {
            Spacer()
            self
            Spacer.height(value)
        }
    }
    func alignToTop(_ value: CGFloat = 0) -> some View {
        VStack(spacing: 0) {
            Spacer.height(value)
            self
            Spacer()
        }
    }
}
extension View {
    func alignToLeft(_ value: CGFloat = 0) -> some View {
        HStack(spacing: 0) {
            Spacer.width(value)
            self
            Spacer()
        }
    }
    func alignToRight(_ value: CGFloat = 0) -> some View {
        HStack(spacing: 0) {
            Spacer()
            self
            Spacer.width(value)
        }
    }
}

// MARK: - Visibility Flags
extension View {
    @ViewBuilder func active(if condition: Bool) -> some View {
        if condition { self }
    }
}

// MARK: - Others
extension View {
    func implementNavigationView() -> some View { NavigationView { self } }
    func implementTabBar() -> some View { safeAreaInset(edge: .bottom, content: TabBarView.init) }
}
