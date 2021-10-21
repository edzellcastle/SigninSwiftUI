//
//  HomeView.swift
//  SigninSwiftUI
//
//  Created by David Lindsay on 10/15/21.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = ViewModel()
    @State private var firstNameText: String = ""
    @State private var emailAddressText: String = ""
    @State private var passwordText: String = ""
    @State private var websiteText: String = ""
    @State private var showImagePicker: Bool = false
    @State private var newImage: UIImage? = nil
    @State private var isValidEmail: Bool = false
    @State private var isValidPassword: Bool = false
    @State private var isEmailAlertPresented: Bool = false
    @State private var isPasswordAlertPresented: Bool = false
    @State private var isShowingConfirmationView = false
    @State var greeting: String = ""
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 10) {
                Spacer()
                    .frame(height: 20)
                Text("Profile Creation")
                    .font(Font.custom("Roboto-Bold", size: 35))
                    .fontWeight(.bold)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                Text("Use the form below to submit your porfolio.\nAn email and password are required.")
                    .foregroundColor(Color(UIColor.darkGray))
                    .font(Font.custom("Roboto-Regular", size: 12))
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
                HStack() {
                    Spacer()
                    ZStack {
                        if let newImage = newImage {
                            Image(uiImage: newImage)
                                .resizable()
                                .frame(width: CGFloat(120), height: CGFloat(150), alignment: .center)
                                .cornerRadius(10.0)
                                .onTapGesture() {
                                    showImagePicker.toggle()
                                }
                        } else {
                            Button(action: {
                                showImagePicker.toggle()
                            }, label: {
                                Text("Tap to add\navatar")
                                    .frame(width: CGFloat(120), height: CGFloat(150), alignment: .center)
                                    .font(.system(size: 12, weight: .medium, design: .default))
                                    .foregroundColor(Color.black)
                                    .background(Color(.systemGray5))
                            })
                            .sheet(isPresented: self.$showImagePicker, onDismiss: {
 
                            }) {
                                ImagePicker(sourceType: .camera, selectedImage: self.$newImage)
                            }
                        }
                    }
                    .cornerRadius(10)
                    Spacer()
                }
                VStack() {
                    TextField("", text: $firstNameText)
                        .textFieldStyle(SigninTextFieldStyle())
                        .modifier(PlaceholderStyle(showPlaceHolder: firstNameText.isEmpty, placeholder: "First Name"))
                    TextField("", text: $emailAddressText)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .textFieldStyle(SigninTextFieldStyle())
                        .modifier(PlaceholderStyle(showPlaceHolder: emailAddressText.isEmpty, placeholder: "Email Address"))
                        .onChange(of: emailAddressText) { (value) in
                            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
                            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
                            isValidEmail = emailPred.evaluate(with: emailAddressText)
                        }
                    SecureField("", text: $passwordText)
                        .textFieldStyle(SigninTextFieldStyle())
                        .modifier(PlaceholderStyle(showPlaceHolder: passwordText.isEmpty, placeholder: "Password"))
                        .onChange(of: passwordText) { (value) in
                            isValidPassword = value.count > 0
                        }
                    TextField("", text: $websiteText)
                        .keyboardType(.URL)
                        .autocapitalization(.none)
                        .textFieldStyle(SigninTextFieldStyle())
                        .modifier(PlaceholderStyle(showPlaceHolder: websiteText.isEmpty, placeholder: "Website"))
                }
                Spacer()
                Button(action: {
                    if isValidEmail == false {
                        isEmailAlertPresented = true
                    }
                    if isValidPassword == false {
                        isPasswordAlertPresented = true
                    }
                    if isValidEmail && isValidPassword {
                        greeting = self.viewModel.submitButtonTapped(firstName: firstNameText, emailAddress: emailAddressText, password: passwordText, website: websiteText, profileImage: newImage)
                        isShowingConfirmationView = true
                    }
                }, label: {
                    Text("Submit")
                        .fontWeight(.medium)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 45, maxHeight: 45)
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .foregroundColor(Color.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.redOrange, Color.orangeOrange]), startPoint: .leading, endPoint: .trailing))
                })
                    .fullScreenCover(isPresented: $isShowingConfirmationView) {
                        ConfirmationView(isShown: $isShowingConfirmationView, profilePicture: $newImage, firstName: $firstNameText, emailAddress: $emailAddressText, website: $websiteText)
                    }
                    .cornerRadius(15)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                Spacer()
                    .frame(height: 20)
            }
            if isEmailAlertPresented {
                RequiredAlertView(isShown: $isEmailAlertPresented, fieldName: "Email address")
            }
            if isPasswordAlertPresented {
                RequiredAlertView(isShown: $isPasswordAlertPresented, fieldName: "Password")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
