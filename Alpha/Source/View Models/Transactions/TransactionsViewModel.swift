//
//  TransactionsViewModel.swift of Alpha
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

@MainActor class TransactionsViewModel: ViewModel<TransactionsRepository> {
    @Sendable func getRewardInformations() async throws -> RewardInformation { try await launch().getRewardInformations().receive(self) }
}
