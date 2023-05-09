//
//  TransactionItem.swift of Alpha
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

struct TransactionItem: View {
    let transaction: Transaction
    @ObservedObject private var stateStore: StateStore = .shared


    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 0) {
                createLeftSide()
                Spacer()
                createRightSide()
            }
        }
    }
}

private extension TransactionItem {
    func createLeftSide() -> some View {
        VStack(alignment: .leading, spacing: 2) {
            createTitle()
            createDateText()
        }
    }
    func createRightSide() -> some View {
        HStack(spacing: 8) {
            createAmountText()
            createForwardIcon()
        }
    }
}

private extension TransactionItem {
    func createTitle() -> some View {
        HStack(spacing: 4) {
            createTitleText()
            createTitleIcon()
        }
    }
    func createDateText() -> some View {
        Text(getDate())
            .font(.caption)
            .foregroundColor(.onBackgroundTertiary)
    }
    func createAmountText() -> some View {
        Text(getAmount())
            .font(.system(size: 15, weight: .semibold))
            .foregroundColor(.onBackgroundPrimary)
    }
    func createForwardIcon() -> some View {
        IconView(.forward, colour: .onBackgroundSecondary, size: 16)
    }
}

private extension TransactionItem {
    func createTitleText() -> some View {
        Text(transaction.title)
            .font(.system(size: 15, weight: .semibold))
            .foregroundColor(.onBackgroundPrimary)
    }
    @ViewBuilder func createTitleIcon() -> some View {
        if let icon = getTitleIcon() {
            icon
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 12)
        }
    }
}

private extension TransactionItem {
    func onTap() {
        stateStore.openTransaction(transaction)
    }
}

private extension TransactionItem {
    func getTitleIcon() -> Image? { transaction.isBird ? Image(.alphaLogo) : nil }
    func getDate() -> String { transaction.date.toString(.date(.full)) }
    func getAmount() -> String { transaction.amount.formatted(.currency(code: "USD")) }
}
