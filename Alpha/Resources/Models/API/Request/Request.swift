//
//  Request.swift of Alpha
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import Foundation

enum Request {
    case getRewardInformations
    case getTransactionDetails
}

extension Request {
    @discardableResult func receiveResponse() async throws -> Data {
        switch self {
            case .getRewardInformations: return try await GetRewardInformations().receiveResponse()
            case .getTransactionDetails: fatalError()
        }
    }
}


// MARK: Helpers
protocol RequestProtocol: Encodable {
    var link: String { get }
    var method: APIHandler.Method { get }
}
extension RequestProtocol {
    @discardableResult func receiveResponse() async throws -> Data { try await APIHandler(self).receiveResponse() }
    var data: Encodable { self }
}
