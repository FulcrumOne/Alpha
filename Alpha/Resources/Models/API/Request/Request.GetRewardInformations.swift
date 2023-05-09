//
//  Request.GetRewardInformations.swift of Alpha
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

extension Request {
    struct GetRewardInformations: RequestProtocol {}
}

extension Request.GetRewardInformations {
    var link: String { "rewards" }
    var method: APIHandler.Method { .GET }
}
