//
//  RowItem.swift of Alpha
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

struct RowItem: View {
    let title: String
    let value: String


    var body: some View {
        HStack(spacing: 0) {
            createTitleText()
            Spacer()
            createValueText()
        }
    }
}

private extension RowItem {
    func createTitleText() -> some View {
        Text(title)
            .font(.system(size: 17, weight: .regular))
            .foregroundColor(.onBackgroundPrimary)
    }
    func createValueText() -> some View {
        Text(value)
            .font(.system(size: 17, weight: .regular))
            .foregroundColor(.onBackgroundTertiary)
    }
}
