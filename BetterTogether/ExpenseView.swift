//
//  ExpenseView.swift
//  BetterTogether
//
//  Created by Daniel Alvarez on 25/08/22.
//

import SwiftUI

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

struct ExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseView()
    }
}
