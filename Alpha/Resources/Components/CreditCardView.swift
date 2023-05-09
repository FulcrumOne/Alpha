//
//  CreditCardView.swift of Alpha
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI
import SwiftDate

struct CreditCardView: View {
    let cardNumber: String
    let expirationDate: Date


    var body: some View {
        createContentView()
            .padding(12)
            .background(createBackgroundView())
    }
}

private extension CreditCardView {
    func createContentView() -> some View {
        ZStack {
            createLeftSideView()
            createRightSideView()
        }
    }
    func createBackgroundView() -> some View {
        Image(.card)
            .resizable()
            .cornerRadius(12)
    }
}

private extension CreditCardView {
    func createLeftSideView() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            createLogoView()
            Spacer.height(80)
            createCardNumber()
            Spacer.height(20)
            createExpirationDateLabel()
            Spacer.height(4)
            createExpirationDateValue()
        }
        .alignToLeft()
    }
    func createRightSideView() -> some View {
        VStack(alignment: .trailing, spacing: 0) {
            Spacer()
            createCardIssuerLogo()
        }
        .alignToRight()
    }
}

private extension CreditCardView {
    func createLogoView() -> some View {
        Image(.alpha)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 32)
    }
    func createCardNumber() -> some View {
        Text(transformCardNumber())
            .font(.system(size: 22, weight: .bold))
            .kerning(4)
            .foregroundColor(.onAccent)
    }
    func createExpirationDateLabel() -> some View {
        Text("Expiration Date")
            .font(.caption2)
            .foregroundColor(.onAccent)
    }
    func createExpirationDateValue() -> some View {
        Text(transformExpirationDate())
            .font(.system(size: 15, weight: .bold))
            .foregroundColor(.onAccent)
    }
    func createCardIssuerLogo() -> some View {
        Image(.visa)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 20)
    }
}

private extension CreditCardView {
    func transformCardNumber() -> String { "**** \(cardNumber.suffix(4))" }
    func transformExpirationDate() -> String { expirationDate.toString(.custom("MM/yy")) }
}
