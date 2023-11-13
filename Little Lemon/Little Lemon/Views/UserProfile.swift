//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Justin Cummings on 11/13/23.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    private let firstName = Foundation.UserDefaults.standard.string(forKey: kFirstName)
    private let lastName = Foundation.UserDefaults.standard.string(forKey: kLastName)
    private let email = Foundation.UserDefaults.standard.string(forKey: kEmail)
    
    

    var body: some View {
        VStack {
            Text("Personal Information")
            Image("profile-image-placeholder")
            Text(firstName ?? "")
            Text(lastName ?? "")
            Text(email ?? "")
            
            Button("Logout") {
                UserDefaults.standard.setValue(false, forKeyPath: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }
            Spacer()
        }
    }
}

#Preview {
    UserProfile()
}
