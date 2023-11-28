//
//  ArticleView.swift
//  truscoop
//
//  Created by Peter Bidoshi on 11/19/23.
//

import SwiftUI

struct ScoopView: View {
    
    @State var scoop: Scoop
    
    var body: some View {
        // Header
        ZStack {
            headerImage

            headerText
            
            article
        }
    }
    
    private var headerImage: some View {
        VStack {
            GeometryReader {geometry in
                AsyncImage(url: URL(string: scoop.top_img)) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.top)
                        .colorMultiply(.gray)
                } placeholder: {
                    Rectangle()
                }
                .frame(width: geometry.size.width, height: geometry.size.height * 0.5)
            }
            
            Spacer()
            
        }.edgesIgnoringSafeArea(.top)
    }
    
    private var headerText: some View {
        VStack (alignment: .leading) {
            // trurating
            HStack(spacing: 0) {
                Text("tru")
                    .font(.system(size: 18, weight: .bold))
                    .bold()
                    .foregroundColor(.white)
                Text("rating").font(.system(size: 18, weight: .regular))
                    .foregroundColor(.white)
            }
            // Rating
            Text(scoop.ai_rating.lowercased())
                .background(Color.init(hex: "#D65A5A"))
                .foregroundStyle(.black)
                .font(.headline)
            // User Racing
            HStack(spacing: 3) {
                Text("User")
                    .font(.system(size: 18, weight: .bold))
                    .bold()
                    .foregroundColor(.white)
                Text("Rating").font(.system(size: 18, weight: .regular))
                    .foregroundColor(.white)
            }
            // Rating
            Text(String(scoop.user_rating))
                .background(Color.init(hex: "#D65A5A"))
                .foregroundStyle(.black)
                .font(.headline)
            
            Text(scoop.name)
                .font(.system(size: 32, weight: .bold))
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))

//                    Text("DATE HERE")
            Text(scoop.date.formatted(.dateTime.day().month().year()))
                .font(.system(size: 12))
                .foregroundColor(.white)
            
            Rectangle()
                .fill(.white)
                .frame(width: 60, height: 8)
            
            Spacer()
        }.offset(x: 0)
    }

    private var article: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .fill(.white)
                    .cornerRadius(30)
                    .frame(width: geometry.size.width, height: 1000, alignment: .center)
                    
                VStack {
                    Text(scoop.summary).padding(30)
                        .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.3, alignment: .center)
                    
                    // Your Rating
                    HStack(spacing: 3) {
                        Text("Your")
                            .font(.system(size: 18, weight: .bold))
                            .bold()
                            .foregroundColor(.black)
                        Text("Rating").font(.system(size: 18, weight: .regular))
                            .foregroundColor(.black)
                    }
                    
                    // Button to webview
                    NavigationLink {
                        SwiftUIWebView(url: URL(string: scoop.url))
                            .navigationTitle("Truscoop Article Viewer")
                    } label: {
                        ZStack {
                            Rectangle()
                                .fill(Color.init(hex: "E1E1E1")!)
                                .cornerRadius(20)
                                .frame(width: geometry.size.width * 0.8, height: 44)
                            
                            Text("Read this Article")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.black)
                        }
                    }
                    
                    Spacer()
                }
                
            }.safeAreaPadding(.bottom)
            .offset(y: geometry.size.height * 0.35)
        }
    }
        
    
}

#Preview {
    ScoopView(scoop: articles[0])
}
