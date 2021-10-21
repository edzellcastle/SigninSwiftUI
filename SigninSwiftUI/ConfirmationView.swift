//
//  ConfirmationView.swift
//  SigninSwiftUI
//
//  Created by David Lindsay on 10/20/21.
//

import SwiftUI

struct ConfirmationView: View {
    @StateObject var viewModel = ViewModel()
    @Binding var isShown: Bool
    @Binding var profilePicture: UIImage?
    @Binding var firstName: String
    @Binding var emailAddress: String
    @Binding var website: String
    
    var greeting: String {
       
        if firstName.count > 0 {
            if firstName.last == " " {
                firstName.removeLast()
            }
            return "Hello, " + firstName + "!"
        } else {
            return "Hello!"
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Spacer()
                .frame(height: 20)
            Text(greeting)
                .font(Font.custom("Roboto-Bold", size: 35))
                .fontWeight(.bold)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            Text("Your super-awesome portfolio has been successfully submitted! The preview below is what the community will see!")
                .foregroundColor(Color(UIColor.darkGray))
                .font(Font.custom("Roboto-Regular", size: 14))
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
            HStack() {
                Spacer()
                ZStack {
                    if let profilePicture = profilePicture {
                        Image(uiImage: profilePicture)
                            .resizable()
                            .frame(width: CGFloat(120), height: CGFloat(150), alignment: .center)
                            .cornerRadius(10.0)
                    }
                }
                .cornerRadius(10)
                Spacer()
            }
            Spacer()
                .frame(height: 20)
            HStack() {
                Spacer()
                VStack(alignment: .center, spacing: 10) {
                    if website.count > 0 {
                        Text(website)
                            .font(Font.system(size: 16, weight: .semibold, design: .default))
                            .foregroundColor(Color.blue)
                            .underline(true, color: Color.blue)
                    }
                    if firstName.count > 0 {
                        Text(firstName)
                            .font(Font.system(size: 16, weight: .semibold, design: .default))
                    }
                    Text(emailAddress)
                        .font(Font.system(size: 16, weight: .semibold, design: .default))
                }
                Spacer()
            }
            Spacer()
            Button(action: {

            }, label: {
                Text("Sign In")
                    .fontWeight(.medium)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 45, maxHeight: 45)
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .foregroundColor(Color.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.redOrange, Color.orangeOrange]), startPoint: .leading, endPoint: .trailing))
            })
                .cornerRadius(15)
                .padding(.leading, 20)
                .padding(.trailing, 20)
            Spacer()
                .frame(height: 20)
            
        }
    }
}
