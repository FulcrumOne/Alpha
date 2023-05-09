//
//  Image++.swift of Alpha
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

extension Image {
    init(_ background: Background) { self.init(background.imageName) }
    init(_ placeholder: Placeholder) { self.init(placeholder.imageName) }
}
