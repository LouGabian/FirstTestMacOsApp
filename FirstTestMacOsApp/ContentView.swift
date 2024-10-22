//
//  ContentView.swift
//  FirstTestMacOsApp
//
//  Created by Jonathan Gusse on 22/10/2024.
//

import SwiftUI

struct Option: Hashable {
    let title: String
    let imageName: String
}




struct ContentView: View {
    var body: some View {
        NavigationView {
            ListView()
            
            MainView()
        }
    }
}


struct ListView: View {
    var body: some View {
        Text("List")
    }
}


struct MainView: View {
    var body: some View {
        Text("Main")
    }
}





#Preview {
    ContentView()
}
