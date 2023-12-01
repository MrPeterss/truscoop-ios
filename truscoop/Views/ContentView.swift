//
//  ContentView.swift
//  truscoop
//
//  Created by Peter Bidoshi on 11/19/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var filter: String
    @State var loading: Bool = false
    @State var searching: Bool = false
    
    @State var search: String = ""
    
    @FocusState var isFocusOn: Bool
    
    @State var scoops: [Scoop] = articles
    
    func searchResults() -> Void {
        if search.isEmpty {
            scoops = articles
        } else { 
            scoops = articles.filter{$0.name.lowercased().contains(search.lowercased())}
        }
    }
    
    var body: some View {
        ZStack {
            NavigationStack {
                ZStack (alignment: Alignment(horizontal: .leading, vertical: .top)) {
                    ScoopsListView(filter: filter, scoops: $scoops).ignoresSafeArea(edges: .bottom).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
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
                            ZStack {
                                HStack(spacing: 20) {
                                    addScoopButton()
                                    addSearchButton()
                                }
                                (searching ?
                                    AnyView(
                                        HStack {
                                            TextField("search", text: $search)
                                                .onChange(of: search) {
                                                    searchResults()
                                                }
                                                .multilineTextAlignment(.trailing)
                                                .focused($isFocusOn)
                                                .font(
                                                    Font.custom("Inter", size: 16)
                                                    .weight(.medium)
                                                )
                                                .padding(8)
                                                .kerning(0.24)
                                                .background(
                                                    Rectangle()
                                                    .foregroundColor(.clear)
                                                    .background(Color(red: 0.99, green: 0.99, blue: 0.99))

                                                    .cornerRadius(2)
                                                    .overlay(
                                                        RoundedRectangle(cornerRadius: 2)
                                                        .stroke(Color(red: 0.7, green: 0.7, blue: 0.7).opacity(0.8), lineWidth: 1.5)
                                                    )
                                                )
                                            addXButton()
                                        }.background(.white)
                                    )
                                    :
                                    AnyView(
                                        EmptyView()
                                    )
                                )
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
            
            (loading ?
                AnyView(
                    ZStack {
                        Rectangle()
                            .opacity(0.6)
                            .ignoresSafeArea()
                        ActionIndicator()
                    }
                )
                :
                AnyView(
                    EmptyView()
                )
            )
        }
    }
    
    private func addScoopButton() -> some View {
        NavigationLink {
            AddScoopView()
        } label: {
            Image("add_scoop")
        }
    }
    
    private func addSearchButton() -> some View {
        Button {
            searching = true
            isFocusOn = true
        } label: {
            Image("search")
        }
    }
    
    private func addXButton() -> some View {
        Button {
            searching = false
            isFocusOn = false
            search = ""
            searchResults()
        } label: {
            Image(systemName: "xmark")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 22)
                .foregroundColor(.black)
                
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
