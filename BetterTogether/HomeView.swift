//
//  HomeView.swift
//  BetterTogether
//
//  Created by Daniel Alvarez on 25/08/22.
//

import SwiftUI

struct HomeView: View {
    @State private var showingAlert = false
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
            List {
                Text("Test 1")
                Text("Test 2")
            }
            .navigationTitle("Better Together")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("Add") {
                        print("Added")
                        showingSheet.toggle()
                    }.sheet(isPresented: $showingSheet) {
                        AddView()
                    }
                    Button("Other") {
                        showingAlert = true
                        print("other")
                    }.alert("Holis", isPresented: $showingAlert) {
                        Button("Okys") {}
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
