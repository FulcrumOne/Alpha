//
//  TransactionDetailsView.swift of Alpha
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

struct TransactionDetailsView: View {
    let transaction: Transaction


    var body: some View {
        VStack(spacing: 0) {
            Spacer.height(16)
            createTopView()
            Spacer.height(16)
            createDetailsSection()
            Spacer()
        }
    }
}

private extension TransactionDetailsView {
    func createTopView() -> some View {
        TransactionSummaryCardView(transaction: transaction)
    }
    func createDetailsSection() -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text.header("Transaction Details")
            createDetailItems()
        }
    }
}

private extension TransactionDetailsView {
    func createDetailItems() -> some View {
        VStack(spacing: 0) {
            createDetailItem("Status", "Completed")
            Divider().padding(.leading, 12)
            createDetailItem("Date", transaction.date.toString(.date(.long)))
        }
        .background(Color.backgroundSecondary)
        .mask(Rectangle().cornerRadius(12))
    }
}

private extension TransactionDetailsView {
    func createDetailItem(_ title: String, _ value: String) -> some View {
        RowItem(title: title, value: value).padding(12)
    }
}
