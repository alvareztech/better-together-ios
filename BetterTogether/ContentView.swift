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
            HomeScreen()
                .tabItem {
                    Label("Overview", systemImage: "chart.pie")
                }
                .tag(1)
            ExpensesScreen()
                .tabItem {
                    Label("Expenses", systemImage: "list.bullet.rectangle.portrait")
                }
                .tag(2)
        }
    }
}

struct HomeScreen: View {
    
    @State private var showingAlert = false
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
            Text("Hello, world!")
                .padding()
                .navigationTitle("Holis")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button("Add") {
                            print("Added")
                            showingSheet.toggle()
                        }.sheet(isPresented: $showingSheet) {
                            AddScreen()
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

struct ExpensesScreen: View {
    var body: some View {
        NavigationView {
            List {
                ExpenseView()
                ExpenseView()
                ExpenseView()
            }
            .navigationTitle("Expenses")
        }
    }
}

struct AddScreen: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var enableLogging = false
    @State private var selectedColor = "Red"
    @State private var colors = ["Red", "Green", "Blue"]
    
    @State private var title = ""
    @State private var amount = ""
    
    var body: some View {
        Form {
            Section(footer: Text("Holis")) {
                TextField("Title", text: $title)
                    .font(.largeTitle)
                
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
                
                Picker("Category", selection: $selectedColor) {
                    ForEach(colors, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                
                Toggle("Enable Logging", isOn: $enableLogging)
            }
            
            Section {
                Button("Close") {
                    dismiss()
                }
            }
        }
    }
}

struct ExpenseView: View {
    var body: some View {
        HStack {
            Image(systemName: "fork.knife")
            VStack(alignment: .leading) {
                Text("Food")
                Text("This is a description")
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text("$ 4.12")
                .font(.headline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
