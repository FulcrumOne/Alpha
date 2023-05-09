//
//  Response.RewardInformation.swift of Alpha
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

extension Response {
    struct RewardInformation: Decodable {
        let cardNumber: String
        let cardExpirationDate: String
        let balance: Double
        let transactions: [Transaction]
    }
}
