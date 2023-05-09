//
//  TabBarView.swift of Alpha
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

struct TabBarView: View {
    var body: some View {
        createItems()
            .padding(.top, 8)
            .padding(.bottom, 4)
            .setFullWidth()
            .background(createBackground())
    }
}

private extension TabBarView {
    func createItems() -> some View {
        HStack(spacing: 0) {
            ForEach(Tab.allCases, id: \.self, content: createItem)
        }
        .setFullWidthWithoutMargins()
    }
    func createBackground() -> some View {
        Rectangle()
            .fill(Color.backgroundSecondary)
            .overlay(Divider().alignToTop())
            .ignoresSafeArea()
    }
}

private extension TabBarView {
    func createItem(_ tab: TabBarView.Tab) -> some View {
        TabBarView_Item(tab: tab)
    }
}
