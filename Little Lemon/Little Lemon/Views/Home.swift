//
//  Home.swift
//  Little Lemon
//
//  Created by Justin Cummings on 11/13/23.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView {
            Menu()
                .tabItem { Label("Menu", systemImage: "list.dash") }
            UserProfile()
                .tabItem { Label("Profile", systemImage: "square.and.pencil") }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    Home()
}
