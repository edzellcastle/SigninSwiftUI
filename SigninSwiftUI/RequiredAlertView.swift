//
//  RequiredAlertView.swift
//  SigninSwiftUI
//
//  Created by David Lindsay on 10/20/21.
//

import SwiftUI

struct RequiredAlertView: View {
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width

    @Binding var isShown: Bool
    var fieldName: String

    var body: some View {
        VStack {
            Spacer()
            Text(fieldName + " is required.")
            Spacer()
            Button(action: {
                self.isShown.toggle()
            }) {
                Text("OK")
                    .fontWeight(.medium)
                    .font(Font.system(size: 14, weight: .semibold, design: .default))
                    .foregroundColor(.black)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1)
                    )
            }
            Spacer()
            
        } .padding()
            .frame(width: screenWidth * 0.7, height: screenHeight * 0.3)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
            .offset(y: isShown ? 0 : screenHeight)
            .shadow(color: Color(UIColor.lightGray), radius:6)
    }
}
