//
//  Articles.swift
//  truscoop
//
//  Created by Peter Bidoshi on 11/19/23.
//

import SwiftUI

struct ScoopsListView: View {
    
    var body: some View {
        List(articles, id: \.self) { scoop in
            ZStack {
                scoopRow(scoop)
                NavigationLink {
                    ScoopView(scoop: scoop)
                } label: {
                    EmptyView()
                }
                .opacity(0.0)

            }
            .listRowSeparator(.hidden)
            .listStyle(.plain)
            Spacer().zIndex(-1)
        }
        .scrollIndicators(.hidden)
        .listStyle(.plain)
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        .buttonStyle(PlainButtonStyle())
        
    }
    
    private func scoopRow(_ article: Scoop) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .background(.clear)
                .foregroundColor(Color(hex: "f3f3f3"))
                .shadow(color: .black.opacity(0.5), radius: 3, x: 0, y: 4)
            
            HStack (alignment: .top) {
                VStack (alignment: .leading) {
                    Image(article.favicon)
                        .resizable()
                        .frame(width: 32, height: 32)
                        .cornerRadius(8)
                    
                    Text(article.name)
                        .font(.custom("Futura Bold Condensed", size: 26))
                        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                    Text(article.summary)
                        .font(.system(size: 14))
                        .lineLimit(4)
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                Spacer()
                
                VStack (alignment: .trailing){
                    VStack (alignment: .trailing, spacing: 2) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 49, height: 8)
                            .background(
                                Group {
                                    switch article.ai_rating {
                                    case "Left":
                                        Color.blue
                                    case "Right":
                                        Color.red
                                    default:
                                        Color.gray
                                    }
                                }
                            )
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 26, height: 3)
                            .background(.black)
                    }
                    HStack(spacing: 0) {
                        Text(String(article.user_rating))
                            .font(.custom("Futura Bold", size: 13))
                        Text("/5")
                            .font(.custom("Futura Bold", size: 13))
                    }
                    Spacer()
                    HStack (spacing: 5) {
                        Text("More")
                            .font(.system(size: 14, weight: .bold))
                        Image(systemName: "arrow.forward")
                        
                        
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ScoopsListView()
}
