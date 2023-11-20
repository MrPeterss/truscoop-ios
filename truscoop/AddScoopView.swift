//
//  AddScoopView.swift
//  truscoop
//
//  Created by Peter Bidoshi on 11/19/23.
//

import SwiftUI

struct AddScoopView: View {
    
    @State var url: String = ""
    
    var body: some View {
        VStack () {
            HStack {
                VStack (alignment: .leading) {
                    Text("Find the reliability and bias of a news source fast, with accurate and up-to-date predictions using Artificial Intelligence. Paste the link below to get started.")
                        .font(.custom("Futura Book", size: 18))
                        .foregroundColor(Color(red: 0.42, green: 0.42, blue: 0.42))
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 60, height: 8)
                        .background(Color(red: 0.41, green: 0.41, blue: 0.41))
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 20, trailing: 0))
                    HStack {
                        TextField("paste URL here", text: $url)
                            .padding(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(red: 0.42, green: 0.42, blue: 0.42), lineWidth: 2)
                            )
                        Button {
                            url = ""
                        } label: {
                            Text("submit")
                                .font(.custom("Futura Bold", size: 18))
                                .foregroundColor(.white)
                                .padding(12)
                                .background(Color(red: 0.42, green: 0.42, blue: 0.42))
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                    }
                }.padding()
                Spacer()
            }
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack(spacing: 0) {
                    Text("tru")
                        .font(.system(size: 32, weight: .bold))
                        .bold()
                    Text("review").font(.system(size: 32, weight: .regular))
                }
                .padding()
            }
        }
    }
}

#Preview {
    AddScoopView()
}
