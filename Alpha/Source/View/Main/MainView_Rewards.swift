//
//  MainView_Rewards.swift of Alpha
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

struct MainView_Rewards: View {
    @ObservedObject private var viewModel: TransactionsViewModel = .shared
    @State private var rewardInformation: RewardInformation = .init()


    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 16) {
                createCardView()
                createCurrentBalanceSection()
                createLatestTransactionsSection()
            }
            .padding(.bottom, 100)
        }
        .animation(.easeInOut, value: rewardInformation.balance)
        .onAppear(perform: onAppear)
    }
}

private extension MainView_Rewards {
    func createCardView() -> some View {
        CreditCardView(cardNumber: rewardInformation.cardNumber, expirationDate: rewardInformation.cardExpirationDate)
    }
    func createCurrentBalanceSection() -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text.header("Current Balance")
            BalanceView(balance: rewardInformation.balance)
        }
    }
    func createLatestTransactionsSection() -> some View {
        VStack(spacing: 4) {
            Text.header("Latest Transactions").alignToLeft()
            createTransactionsList()
        }
    }
}

private extension MainView_Rewards {
    func createTransactionsList() -> some View {
        VStack(spacing: 0) {
            ForEach(rewardInformation.transactions, id: \.id) {
                TransactionItem(transaction: $0).padding(12)
                Divider().padding(.leading, 12)
            }
        }
        .background(Color.backgroundSecondary)
        .mask(Rectangle().cornerRadius(12))
        .animation(nil, value: rewardInformation.transactions.count)
    }
}

private extension MainView_Rewards {
    func onAppear() { Task {
        rewardInformation = try await viewModel.getRewardInformations()
    }}
}
