//
//  Menu.swift
//  Little Lemon
//
//  Created by Justin Cummings on 11/13/23.
//

import SwiftUI

var applicationTitle = "Little Lemon"
var restaurantLocation = "Chicago"
var applicationShortDescription = "Browse and order from the restaurant's local menu."

struct Menu: View {
    var body: some View {
        VStack {
            Text(applicationTitle)
            Text(restaurantLocation)
            Text(applicationShortDescription)
            List {
                // menu items
            }
        }
    }
}

#Preview {
    Menu()
}
