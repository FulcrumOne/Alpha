//
//  TransactionsRepository.swift of Alpha
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

class TransactionsRepository: Repository {
    func getRewardInformations() async -> RepositoryResult<RewardInformation> { await .init {
        let data = try await Request.getRewardInformations.receiveResponse()
        let decodedData = try data.decode(with: Response.RewardInformation.self)
        let locallyDecodedData = RewardInformation(decodedData)
        return locallyDecodedData
    }}
    func getTransactionDetails() {}
}
