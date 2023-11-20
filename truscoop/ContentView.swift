//
//  ContentView.swift
//  truscoop
//
//  Created by Peter Bidoshi on 11/19/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScoopsListView()
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        HStack(spacing: 0) {
                            Text("tru")
                                .font(.system(size: 32, weight: .bold))
                                .bold()
                            Text("scoop").font(.system(size: 32, weight: .regular))
                        }
                        .padding()
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack(spacing: 20) {
                            addScoopButton()
                            Image("search")
                        }
                        .padding()
                    }
                }
        }
    }
    
    private func addScoopButton() -> some View {
        NavigationLink {
            AddScoopView()
        } label: {
            Image("add_scoop")
        }
    }
}

#Preview {
    ContentView()
}
