//
//  Transaction.swift of Alpha
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

struct Transaction {
    let id: String
    let title: String
    let date: Date
    let amount: Double
    let isBird: Bool
}
extension Transaction {
    init(_ transaction: Response.Transaction) {
        self.id = transaction.id
        self.title = transaction.title
        self.date = transaction.date.toDate("yyyy-MM-dd")?.date ?? .init()
        self.amount = transaction.amount
        self.isBird = transaction.bird
    }
}
