//
//  HomeView.swift
//  EyeApp
//
//  Created by Macintosh on 6/27/20.
//  Copyright © 2020 IVDEV. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            Color(#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            GeometryReader{ geometry in
                VStack {
                    Button(action: {
                        print("1")
                    }) {
                        ZStack {
                            Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
                            VStack {
                                Image(systemName: "eyeglasses")
                                    .resizable()
                                    .frame(width: geometry.size.width/2, height: geometry.size.width/2)
                                    .accentColor(Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)))
                                Text("Упражнения")
                                    .font(.largeTitle)
                                    .foregroundColor(Color.black)
                            }
                            
                        }
                        .cornerRadius(30)
                        .padding()
                        
                    }
                    .frame(width: geometry.size.width, height: geometry.frame(in: .global).height/2)
                    
                    
                    
                    Button(action: {
                        print("2")
                    }) {
                        ZStack {
                            Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
                            VStack {
                                Image(systemName: "star.circle")
                                    .resizable()
                                    .frame(width: geometry.size.width/2, height: geometry.size.width/2)
                                    .accentColor(Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)))
                                Text("Тесты")
                                    .font(.largeTitle)
                                    .foregroundColor(Color.black)
                            }
                            
                        }
                        .cornerRadius(30)
                        .padding()
                    }
                    .frame(width: geometry.size.width, height: geometry.frame(in: .global).height/2)
                }
                .padding(.horizontal)
                
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
