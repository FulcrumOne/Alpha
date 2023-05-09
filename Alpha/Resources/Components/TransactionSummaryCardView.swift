//
//  TransactionSummaryCardView.swift of Alpha
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

struct TransactionSummaryCardView: View {
    let transaction: Transaction


    var body: some View {
        VStack(spacing: 0) {
            createIconView()
            Spacer.height(8)
            createTitleText()
            createAmountText()
            createCaption()
        }
        .padding(.vertical, 32)
        .setFullWidthWithoutMargins()
        .background(Color.backgroundSecondary)
        .cornerRadius(12)
    }
}

private extension TransactionSummaryCardView {
    func createIconView() -> some View {
        Image(transaction.isBird ? .alphaLogo : .payment)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 40)
            .frame(48)
            .background(transaction.isBird ? Color.accent.opacity(0.24) : Color.onBackgroundPrimary.opacity(0.24))
            .mask(Rectangle().cornerRadius(8))
    }
    func createTitleText() -> some View {
        Text(transaction.title)
            .font(.system(size: 17, weight: .regular))
            .foregroundColor(.onBackgroundPrimary)
    }
    func createAmountText() -> some View {
        Text(getAmount())
            .font(.system(size: 34, weight: .bold))
            .foregroundColor(.onBackgroundPrimary)
    }
    func createCaption() -> some View {
        Text("Congratulations on earning your bird!")
            .font(.system(size: 13, weight: .regular))
            .foregroundColor(.onBackgroundTertiary)
            .multilineTextAlignment(.center)
            .padding(.top, 8)
            .active(if: transaction.isBird)
    }
}

private extension TransactionSummaryCardView {
    func getAmount() -> String { transaction.amount.formatted(.currency(code: "USD")) }
}
