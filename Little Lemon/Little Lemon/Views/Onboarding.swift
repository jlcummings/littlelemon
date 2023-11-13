//
//  Onboarding.swift
//  Little Lemon
//
//  Created by Justin Cummings on 11/12/23.
//

import RegexBuilder
import SwiftUI

let kFirstName = "Carlos"
let kLastName = "Santana"
let kEmail = "carlos@santana.music"
let kIsLoggedIn = "kIsLoggedIn"

// https://developer.apple.com/documentation/RegexBuilder
let word = OneOrMore(.word)
let emailPattern = Regex {
    Capture {
        ZeroOrMore {
            word
            "."
        }
        word
    }
    "@"
    Capture {
        word
        OneOrMore {
            "."
            word
        }
    }
}

struct Onboarding: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var onBoardingSuccess = false
    @State var isLoggedIn = false

    // for development purposes to simulate action
    @State var buttonPressed = false

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                TextField("Email", text: $email)
                Button("Register") {
                    buttonPressed = true
                    if firstName.isEmpty == false && lastName.isEmpty == false && email.isEmpty == false && isValidEmail(text: email) {
                        UserDefaults.standard.setValue(firstName, forKey: kFirstName)
                        UserDefaults.standard.setValue(lastName, forKey: kLastName)
                        UserDefaults.standard.setValue(email, forKey: kEmail)
                        UserDefaults.standard.setValue(isLoggedIn, forKey: kIsLoggedIn)
                        isLoggedIn = true
                        onBoardingSuccess = true
                    } else {
                        isLoggedIn = false
                        onBoardingSuccess = false
                    }
                }
            }
            .onAppear() {
                isLoggedIn = UserDefaults.standard.bool(forKey: kIsLoggedIn)
            }
            .padding()
        }
    }

    private func isValidEmail(text: String) -> Bool {
        // https://developer.apple.com/documentation/RegexBuilder
        return text.firstMatch(of: emailPattern) != nil
    }
}

#Preview {
    NavigationStack {
        Onboarding()
    }
}
