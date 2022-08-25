//
//  ExpensesView.swift
//  BetterTogether
//
//  Created by Daniel Alvarez on 25/08/22.
//

import SwiftUI

struct ExpensesView: View {
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

struct ExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesView()
    }
}
