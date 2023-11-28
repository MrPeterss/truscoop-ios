//
//  ArticleView.swift
//  truscoop
//
//  Created by Peter Bidoshi on 11/19/23.
//

import SwiftUI

struct ScoopView: View {
    
    @State var scoop: Scoop
    @State var selectedRating: String = "none"
    
    var body: some View {
        // Header
        ZStack {
            headerImage

            headerText
            
            article
        }
    }
    
    private func userInButton(color: String, value: String) -> some View {
        Button {
            print("selected rating set to \(value)")
            selectedRating = value
        } label: {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color(hex: color)!)
                .stroke(selectedRating == value ? .black: .clear, lineWidth: 3)
                .shadow(color: .black.opacity(0.5), radius: 1, x: 0, y: 1)

        }
    }
    
    private var headerImage: some View {
        VStack {
            ZStack {
                GeometryReader {geometry in
                    AsyncImage(url: URL(string: scoop.top_img)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.top)
                    } placeholder: {
                        Rectangle()
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.5)
                }
                Rectangle()
                    .fill(.black.opacity(0.75))
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
        }
    }
    
    private var article: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .fill(.white)
                    .cornerRadius(30)
                    .frame(width: geometry.size.width, height: 1000, alignment: .center)
                VStack(alignment: .leading) {
                    Text(scoop.summary)
                        .font(.custom("Futura", size: 15))
                        .frame(height: 100)
                        .lineLimit(4)
                    
                    // Your Rating
                    VStack {
                        HStack(spacing: 3) {
                            Text("Your")
                                .font(.custom("Futura Bold", size: 18))
                                .foregroundColor(.black)
                            Text("Rating")
                                .font(.custom("Futura", size: 18))
                                .foregroundColor(.black)
                            Spacer()
                        }
                        HStack(spacing: 10) {
                            userInButton(color: "0F7FBC", value: "very liberal")
                            userInButton(color: "5AB0EE", value: "liberal")
                            userInButton(color: "909090", value: "neutral")
                            userInButton(color: "E86868", value: "conservative")
                            userInButton(color: "BC5050", value: "very conservative")
                        }
                        .frame(height: 30)
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 45, trailing: 0))
                    
                    // Button to webview
                    NavigationLink {
                        SwiftUIWebView(url: URL(string: scoop.url))
                            .navigationTitle("Truscoop Article Viewer")
                    } label: {
                        ZStack {
                            Rectangle()
                                .fill(Color.init(hex: "E1E1E1")!)
                                .cornerRadius(20)
                                .frame(height: 44)
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 2)
                            
                            Text("Read this Article")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.black)
                        }
                    }
                    Spacer()
                }
                .padding(EdgeInsets(top: 15, leading: 25, bottom: 0, trailing: 25))
            }
            .safeAreaPadding(.bottom)
            
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .offset(y: geometry.size.height * 0.35)
        }
    }
        
    
}

#Preview {
    ScoopView(scoop: articles[0])
}
