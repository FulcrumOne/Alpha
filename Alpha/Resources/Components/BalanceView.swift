//
//  BalanceView.swift of Alpha
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

struct BalanceView: View {
    let balance: Double


    var body: some View {
        createText()
            .padding(12)
            .background(createBackground())
    }
}

private extension BalanceView {
    func createText() -> some View {
        VStack(alignment: .leading, spacing: 4) {
            createLabel()
            createValue()
        }
        .alignToLeft()
    }
    func createBackground() -> some View {
        RoundedRectangle(cornerRadius: 12).fill(Color.backgroundSecondary)
    }
}

private extension BalanceView {
    func createLabel() -> some View {
        Text(getLabel())
            .font(.caption)
            .foregroundColor(.onBackgroundTertiary)
    }
    func createValue() -> some View {
        Text(getBalance())
            .font(.system(size: 30, weight: .bold))
            .foregroundColor(.onBackgroundPrimary)
    }
}

private extension BalanceView {
    func getLabel() -> String { "Balance as of \(Date().toString(.date(.long)))" }
    func getBalance() -> String { balance.formatted(.currency(code: "USD")) }
}
