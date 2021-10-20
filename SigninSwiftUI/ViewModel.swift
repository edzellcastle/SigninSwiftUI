//
//  ViewModel.swift
//  SigninSwiftUI
//
//  Created by David Lindsay on 10/16/21.
//

import SwiftUI

class ViewModel: ObservableObject {
    @State var firstName: String
    @State var emailAddress: String
    @State var password: String
    @State var website: String
    
    init() {
        firstName = ""
        emailAddress = ""
        password = ""
        website = ""
    }
    
    func submitButtonTapped(firstName: String, emailAddress: String, password: String, website: String, profileImage: UIImage?) {
        
    }
}
