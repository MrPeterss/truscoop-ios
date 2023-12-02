//
//  ScoopRow.swift
//  truscoop-ios
//
//  Created by Peter Bidoshi on 12/1/23.
//

import SwiftUI

struct ScoopRow: View {
    
    @State var article: Scoop
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .background(.clear)
                .foregroundColor(Color(hex: "f3f3f3"))
                .shadow(color: .black.opacity(0.5), radius: 3, x: 0, y: 4)
            
            HStack (alignment: .center, spacing: 20) {
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
                        .font(.system(size: 24, weight: .bold))
                        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    Text("\(article.summary.replacingOccurrences(of: "\n", with: " "))\n\n")
                        .font(.system(size: 14))
                        .lineLimit(3)
                }
                
                Spacer()
                
                VStack (alignment: .trailing){
                    VStack (alignment: .trailing, spacing: 2) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 49, height: 8)
                            .background(
                                Group {
                                    switch article.aiRating {
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
