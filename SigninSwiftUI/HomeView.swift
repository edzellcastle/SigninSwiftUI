//
//  HomeView.swift
//  SigninSwiftUI
//
//  Created by David Lindsay on 10/15/21.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = ViewModel()
    @State private var firstNameText = ""
    @State private var emailAddressText = ""
    @State private var passwordText = ""
    @State private var websiteText = ""
    @State private var showImagePicker: Bool = false
    @State private var newImage: UIImage? = nil
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 10) {
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
                        .textFieldStyle(SigninTextFieldStyle())
                        .modifier(PlaceholderStyle(showPlaceHolder: emailAddressText.isEmpty, placeholder: "Email Address"))
                    SecureField("", text: $passwordText)
                        .textFieldStyle(SigninTextFieldStyle())
                        .modifier(PlaceholderStyle(showPlaceHolder: passwordText.isEmpty, placeholder: "Password"))
                    TextField("", text: $websiteText)
                        .textFieldStyle(SigninTextFieldStyle())
                        .modifier(PlaceholderStyle(showPlaceHolder: websiteText.isEmpty, placeholder: "Website"))
                }
                Spacer()
                Button(action: {
                    self.viewModel.storeProfileImage()
                }, label: {
                    Text("Submit")
                        .fontWeight(.medium)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 45, maxHeight: 45)
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .foregroundColor(Color.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.redOrange, Color.orangeOrange]), startPoint: .leading, endPoint: .trailing))
                })
                    .cornerRadius(15)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
