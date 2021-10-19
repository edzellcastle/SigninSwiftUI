//
//  PlaceholderStyle.swift
//  SigninSwiftUI
//
//  Created by David Lindsay on 10/19/21.
//

import SwiftUI

public struct PlaceholderStyle: ViewModifier {
    var showPlaceHolder: Bool
    var placeholder: String

    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceHolder {
                Text(placeholder)
                .font(Font.system(size: 12, weight: .semibold, design: .default))
                .foregroundColor(Color(UIColor.darkGray))
                .padding(.horizontal, 40)
            } else {
                Text("")
            }
            content
                .foregroundColor(Color(UIColor.darkGray))
        }
    }
}
