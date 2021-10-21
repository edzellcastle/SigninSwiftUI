//
//  ViewModel.swift
//  SigninSwiftUI
//
//  Created by David Lindsay on 10/16/21.
//

import SwiftUI

class ViewModel: ObservableObject {
    private var model = Model()
    @State var firstName: String
    @State var emailAddress: String
    @State var password: String
    @State var website: String
    @State var profileImage: UIImage?
    @State var greeting: String
    
    init() {
        firstName = ""
        emailAddress = ""
        password = ""
        website = ""
        greeting = ""
    }
    
    func submitButtonTapped(firstName: String, emailAddress: String, password: String, website: String, profileImage: UIImage?) -> String {
        self.firstName = firstName
        self.emailAddress = emailAddress
        self.password = password
        self.website = website
        self.profileImage = profileImage
        
        model.storeUserData(firstName: firstName, emailAddress: emailAddress, password: password, website: website, profileImage: profileImage)
        if firstName.count > 0 {
            greeting = "Hello, " + firstName + "!"
        } else {
            greeting = "Hello!"
        }
        return self.greeting
    }
}
