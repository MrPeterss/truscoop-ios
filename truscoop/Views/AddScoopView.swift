//
//  AddScoopView.swift
//  truscoop
//
//  Created by Peter Bidoshi on 11/19/23.
//

import SwiftUI

struct AddScoopView: View {
    
    @State var url: String = ""
    
    @EnvironmentObject var network: NetworkWrapper
    
    var body: some View {
        ZStack {
            
            headerImage
            
            headerText
            
            newScoop
            
            (network.loading ?
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
    
    private var headerImage: some View {
        VStack {
            ZStack {
                GeometryReader {geometry in
                    AngularGradient(
                        stops: [
                            Gradient.Stop(color: Color(red: 0.45, green: 0.45, blue: 0.45), location: 0.00),
                            Gradient.Stop(color: Color(red: 0.26, green: 0.26, blue: 0.26), location: 1.00),
                        ],
                        center: UnitPoint(x: 0.85, y: 0.30),
                        angle: Angle(degrees: -165)
                    )
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.5)
                }
                
                Rectangle()
                    .opacity(0.7)
            }
            
            Spacer()
            
        }.edgesIgnoringSafeArea(.top)
    }
    
    private var headerText: some View {
        VStack (alignment: .leading, spacing: 20) {
            // trurating
            VStack (alignment: .leading, spacing: 0){
                HStack(spacing: 0) {
                    Text("tru")
                        .font(.system(size: 36, weight: .bold))
                        .bold()
                        .foregroundColor(.white)
                    Text("review").font(.system(size: 36, weight: .regular))
                        .foregroundColor(.white)
                }
                
                Rectangle()
                    .fill(.white)
                    .frame(height: 3)
            }
            
            VStack (alignment: .leading, spacing: 5) {
                
                Text("Find the reliability and bias of a news source fast, with accurate and up-to-date predictions using Artificial Intelligence. Paste the link below to get started.")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(Color(hex: "E0E0E0"))
                
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 60, height: 5)
                    .background(Color(red: 0.65, green: 0.65, blue: 0.65))
            }
            
            Spacer()
        }
        .padding(EdgeInsets(top: 30, leading: 30, bottom: 0, trailing: 30))
    }
    
    private var newScoop: some View {
        
        GeometryReader { geometry in
            ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                Rectangle()
                    .fill(Color(hex: "F3F3F3")!)
                    .cornerRadius(30)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.67, alignment: .center)
                VStack(spacing: 30) {
                    
                    TextField("paste url here", text: $url)
                        .font(
                        Font.custom("Inter", size: 16)
                        .weight(.medium)
                        )
                        .padding(11)
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
                    
                    Button {
                        
                    } label: {
                        ZStack {
                            Rectangle()
                                .fill(Color.init(hex: "E1E1E1")!)
                                .cornerRadius(20)
                                .frame(height: 44)
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 2)
                            
                            Text("Submit")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.black)
                        }
                    }
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .background(Color(red: 0.91, green: 0.91, blue: 0.91))
                        
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(red: 0.76, green: 0.76, blue: 0.76), style: StrokeStyle(lineWidth: 1, dash: [2, 2]))
                            )
                    }

                    
                    
                }.padding(EdgeInsets(top: 40, leading: 40, bottom: 40, trailing: 40))
            }
            .offset(y: geometry.size.height * 0.37)
            .safeAreaPadding(.bottom)
        }
    }
}

#Preview {
    AddScoopView()
}
