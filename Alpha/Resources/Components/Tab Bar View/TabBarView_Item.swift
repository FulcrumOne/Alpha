//
//  TabBarView_Item.swift of Alpha
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

struct TabBarView_Item: View {
    let tab: TabBarView.Tab
    @ObservedObject private var stateStore: StateStore = .shared


    var body: some View {
        Button(action: onTapAction, label: createButtonLabel).frame(maxWidth: .infinity)
    }
}

private extension TabBarView_Item {
    func createButtonLabel() -> some View {
        VStack(spacing: 2) {
            createImage()
            createText()
        }
    }
}

private extension TabBarView_Item {
    func createImage() -> some View {
        IconView(tab.icon, colour: isActive ? .accent : .onBackgroundSecondary, size: 26)
    }
    func createText() -> some View {
        Text(tab.text)
            .font(.system(size: 10, weight: .medium))
            .foregroundColor(isActive ? .accent : .onBackgroundSecondary)
    }
}

private extension TabBarView_Item {
    func onTapAction() {
        stateStore.changeActiveTab(to: tab)
    }
}

private extension TabBarView_Item {
    var isActive: Bool { stateStore.activeTab == tab }
}
