//
//  SigninTextFieldStyle.swift
//  SigninSwiftUI
//
//  Created by David Lindsay on 10/19/21.
//

import SwiftUI

struct SigninTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .frame(height: 40)
            .padding([.horizontal], 10)
            .font(Font.system(size: 12, weight: .semibold, design: .default))
            .foregroundColor(Color(.black))
            .cornerRadius(16)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.systemGray4)))
            .padding([.horizontal], 20)
            .disableAutocorrection(true)
    }
}
