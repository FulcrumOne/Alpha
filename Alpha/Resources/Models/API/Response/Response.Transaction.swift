//
//  Response.Transaction.swift of Alpha
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

extension Response {
    struct Transaction: Decodable {
        let id: String
        let title: String
        let date: String
        let amount: Double
        let bird: Bool
    }
}
