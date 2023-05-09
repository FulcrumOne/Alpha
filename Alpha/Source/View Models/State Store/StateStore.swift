//
//  StateStore.swift of Alpha
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

@MainActor class StateStore: ViewModel<StateStoreRepository> {
    @Published private(set) var openedTransaction: Transaction?
    @Published private(set) var activeTab: TabBarView.Tab = .rewards
}

extension StateStore {
    func openTransaction(_ transaction: Transaction?) { withAnimation(.easeInOut) {
        openedTransaction = transaction
    }}
    func changeActiveTab(to tab: TabBarView.Tab) { withAnimation(.easeInOut) {
        activeTab = tab
    }}
}
