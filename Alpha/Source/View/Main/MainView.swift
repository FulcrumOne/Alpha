//
//  MainView.swift of Alpha
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

struct MainView: View {
    @ObservedObject private var stateStore: StateStore = .shared
    @State private var navigationBarTitle: String = ""


    var body: some View {
        createContentView()
            .ignoresSafeArea(.all, edges: .bottom)
            .navigationBarTitle(getNavigationBarTitle(), displayMode: stateStore.openedTransaction == nil ? .automatic : .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: createBackButton())
            .setFullWidthWithoutMargins()
            .implementTabBar()
            .implementNavigationView()
            .onAppear(perform: onAppear)
    }
}

private extension MainView {
    func createBackButton() -> some View {
        Button(action: onBackButtonTap) { Self.backButtonLabel(navigationBarTitle) }
            .active(if: stateStore.openedTransaction != nil)
    }
    @ViewBuilder func createContentView() -> some View {
        switch stateStore.openedTransaction {
            case .some(let transaction): TransactionDetailsView(transaction: transaction)
            case nil: MainView_Rewards()
        }
    }
}

private extension MainView {
    func getNavigationBarTitle() -> String { stateStore.openedTransaction == nil ? navigationBarTitle : "" }
    func getBackButtonText() -> String { navigationBarTitle }
}

private extension MainView {
    func onAppear() { navigationBarTitle = stateStore.activeTab.text }
    func onBackButtonTap() { stateStore.openTransaction(nil) }
}


// MARK: - Back Button
fileprivate extension View {
    static func backButtonLabel(_ text: String) -> some View {
        HStack(spacing: 2) {
            IconView(.back, colour: .accent, size: 18)
            Text(text)
                .font(.system(size: 17, weight: .regular))
                .foregroundColor(.accent)
        }
    }
}
