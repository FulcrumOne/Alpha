//
//  Data++.swift of Alpha
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

extension Data {
    func decode<T: Decodable>(with type: T.Type) throws -> T { try JSONDecoder().decode(type, from: self) }
}
