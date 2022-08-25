//
//  AddView.swift
//  BetterTogether
//
//  Created by Daniel Alvarez on 25/08/22.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var enableLogging = false
    @State private var selectedColor = "Red"
    @State private var colors = ["Red", "Green", "Blue"]
    
    @State private var title = ""
    @State private var amount = ""
    
    var body: some View {
        NavigationView {
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
            .navigationTitle("Add")
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
