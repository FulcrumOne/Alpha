//
//  Image.Assets.swift of Alpha
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

extension IconView {
    enum SingleColour: ImageAssets {
        case back
        case forward
        case profile
        case reward

        var imageNamePrefix: String { "sc" }
    }
}
extension Image {
    enum Background: ImageAssets {
        case card

        var imageNamePrefix: String { "bg" }
    }
    enum Placeholder: ImageAssets {
        case alpha
        case alphaLogo
        case payment
        case visa

        var imageNamePrefix: String { "tmp" }
    }
}

// MARK: - Protocol Helper
protocol ImageAssets {
    var imageNamePrefix: String { get }
}
extension ImageAssets {
    var imageName: String { "\(imageNamePrefix)_\(String(describing: self).camelCaseToSnakeCase())"  }
}
fileprivate extension String {
    func camelCaseToSnakeCase() -> String {
        unicodeScalars
            .dropFirst()
            .reduce(String(prefix(1))) { CharacterSet.uppercaseLetters.contains($1) ? $0 + "_" + String($1) : $0 + String($1) }
            .lowercased()
    }
}
