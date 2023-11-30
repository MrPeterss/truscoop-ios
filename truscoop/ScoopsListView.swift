//
//  Articles.swift
//  truscoop
//
//  Created by Peter Bidoshi on 11/19/23.
//

import SwiftUI

struct ScoopsListView: View {
    
    var filter: String
    
    var body: some View {
        ZStack (alignment: Alignment(horizontal: .center, vertical: .top)) {
            VStack {
                Rectangle()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [.black.opacity(0.1), .clear]),
                        startPoint: .init(x: 0.50, y: 0.00),
                        endPoint: .init(x: 0.50, y: 1.00)
                    ))
                    .stroke(.clear)
                    .frame(height: 7)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                Spacer()
                Rectangle()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [.clear, .black.opacity(0.2)]),
                        startPoint: .init(x: 0.50, y: 0.00),
                        endPoint: .init(x: 0.50, y: 1.00)
                    ))
                    .stroke(.clear)
                    .frame(height: 50)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
            .zIndex(10)
            List(filter == "all" ? articles : articles.filter({ $0.ai_rating == filter }), id: \.self) { scoop in
                ZStack {
                    scoopRow(scoop)
                    NavigationLink {
                        ScoopView(scoop: scoop)
                    } label: {
                        EmptyView()
                    }
                    .opacity(0.0)
                }
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                .listRowSeparator(.hidden)
                .listRowBackground(Color.white)
                .listStyle(.plain)
            }
            .listRowSpacing(20)
            .scrollIndicators(.hidden)
            .listStyle(.plain)
            .padding(EdgeInsets(top: 20, leading: 10, bottom: 10, trailing: 10))
        }
    }

    func scoopRow(_ article: Scoop) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .background(.clear)
                .foregroundColor(Color(hex: "f3f3f3"))
                .shadow(color: .black.opacity(0.5), radius: 3, x: 0, y: 4)
            
            HStack (alignment: .top) {
                VStack (alignment: .leading) {
                    (article.favicon != "null" ?
                     AnyView(
                        AsyncImage(url: URL(string: article.favicon)) { image in
                            image.resizable()
                                .frame(width: 32, height: 32)
                                .cornerRadius(8)
                        } placeholder: {
                            Rectangle()
                                .background(Color(hex: "000000"))
                                .frame(width: 32, height: 32)
                                .cornerRadius(8)
                        }
                     ):
                        AnyView(Rectangle()
                            .background(Color(hex: "000000"))
                            .frame(width: 32, height: 32)
                            .cornerRadius(8))
                    )
                    
                    Text(article.name)
                        .font(.custom("Futura Bold Condensed", size: 26))
                        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    Text(article.summary)
                        .font(.system(size: 14))
                        .lineLimit(3)
                }
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                
                Spacer()
                
                VStack (alignment: .trailing){
                    VStack (alignment: .trailing, spacing: 2) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 49, height: 8)
                            .background(
                                Group {
                                    switch article.ai_rating {
                                    case "liberal":
                                        Color.blue
                                    case "conservative":
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
                    Spacer()
                    HStack (spacing: 5) {
                        Text("More")
                            .font(.system(size: 14, weight: .bold))
                        Image(systemName: "arrow.forward")
                        
                        
                    }
                }
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        }
    }
}

#Preview {
    ScoopsListView(filter: "all")
}
