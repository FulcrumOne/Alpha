//
//  IconView.swift of Alpha
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

struct IconView: View {
    let imageName: String
    let size: CGFloat
    var colour: Color? = nil


    init(_ icon: SingleColour, colour: Color, size: CGFloat) { self.imageName = icon.imageName; self.size = size; self.colour = colour }
    var body: some View { UIScalableImage(name: imageName, tintColor: UIColor(colour ?? .clear)).frame(size) }
}


// MARK: - Scalable Image
fileprivate struct ScalableImage: View {
    let imageName: String
    let tintColour: Color


    var body: some View {
        UIScalableImage(name: imageName, tintColor: UIColor(tintColour))
    }
}

fileprivate struct UIScalableImage: UIViewRepresentable {
    let name: String
    let tintColor: UIColor


    func makeUIView(context: Context) -> UIImageView {
        let imageView = UIImageView()
        imageView.setContentCompressionResistancePriority(.fittingSizeLevel, for: .vertical)
        return imageView
    }
    func updateUIView(_ uiView: UIImageView, context: Context) {
        uiView.contentMode = .scaleAspectFit
        uiView.tintColor = tintColor
        uiView.image = UIImage(named: name)
    }
}
