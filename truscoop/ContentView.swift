//
//  ContentView.swift
//  truscoop
//
//  Created by Peter Bidoshi on 11/19/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var filter: String
    
    var body: some View {
        NavigationStack {
            ZStack (alignment: Alignment(horizontal: .leading, vertical: .top)) {
                ScoopsListView(filter: filter).ignoresSafeArea(edges: .bottom).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
                .safeAreaInset(edge:.top) {
                    VStack {
                        HStack() {
                            HStack(spacing: 0) {
                                Text("tru")
                                    .font(.system(size: 32, weight: .bold))
                                    .bold()
                                Text("scoop").font(.system(size: 32, weight: .regular))
                            }
                            Spacer()
                            HStack(spacing: 20) {
                                addScoopButton()
                                Image("search")
                            }
                        }
                        ScrollView(.horizontal) {
                            HStack(spacing: 33) {
                                filterButton(filterName: "all")
                                filterButton(filterName: "liberal")
                                filterButton(filterName: "neutral")
                                filterButton(filterName: "conservative")
                            }
                        }
                        .scrollIndicators(.hidden)
                    }
                    .padding()
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
    
    private func filterButton(filterName: String) -> some View {
        Button {
            filter = filterName
        } label: {
            Text(filterName).font(.system(size: 22, weight: .semibold))
                .foregroundColor(filter != filterName ? Color(red: 0.76, green: 0.76, blue: 0.76): .black)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ContentView(filter: "all")
}
