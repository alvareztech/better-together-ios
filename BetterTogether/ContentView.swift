//
//  ContentView.swift
//  BetterTogether
//
//  Created by Daniel Alvarez on 24/08/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedView = 1
    
    var body: some View {
        TabView(selection: $selectedView) {
            HomeView()
                .tabItem {
                    Label("Overview", systemImage: "chart.pie")
                }
                .tag(1)
            ExpensesView()
                .tabItem {
                    Label("Expenses", systemImage: "list.bullet.rectangle.portrait")
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
