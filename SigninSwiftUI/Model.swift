//
//  Model.swift
//  SigninSwiftUI
//
//  Created by David Lindsay on 10/20/21.
//

import SwiftUI

class Model {
    private var profilePicture: UIImage?
    private var userName: String?
    private var emailAddress: String = ""
    private var password: String = ""
    private var website: String?
    
    init() {
        
    }
    
    func storeUserData(firstName: String, emailAddress: String, password: String, website: String, profileImage: UIImage?) {
        if let profileImage = profileImage {
            self.profilePicture = profileImage
            self.userName = firstName
            self.emailAddress = emailAddress
            self.password = password
            self.website = website
        }
        
    } 
}
