//
//  RewardInformation.swift of Alpha
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

struct RewardInformation {
    var cardNumber: String = "0000"
    var cardExpirationDate: Date = .init()
    var balance: Double = 0
    var transactions: [Transaction] = []
}
extension RewardInformation {
    init(_ rewardInformation: Response.RewardInformation) {
        self.cardNumber = rewardInformation.cardNumber
        self.cardExpirationDate = rewardInformation.cardExpirationDate.toDate(style: .custom("yyyy-MM"))?.date ?? .init()
        self.balance = rewardInformation.balance
        self.transactions = rewardInformation.transactions.map { .init($0) }
    }
}
