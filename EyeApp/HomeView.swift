//
//  HomeView.swift
//  EyeApp
//
//  Created by Macintosh on 6/27/20.
//  Copyright © 2020 IVDEV. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State private var isExercisesView = false
    @State private var isTestsView = false
    
    @State private var isShowingHomeView = true
    
    var body: some View {
        NavigationView {
            ZStack{
                Color(#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1))
                    .edgesIgnoringSafeArea(.all)
                
                GeometryReader{ geometry in
                    VStack {
                        NavigationLink(destination: Exercises().onAppear{self.isShowingHomeView = false}, isActive: self.$isExercisesView) {
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
                        NavigationLink(destination: Tests().onAppear{self.isShowingHomeView = false}, isActive: self.$isTestsView) {
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
            .navigationBarTitle(Text("Назад"))
            .navigationBarHidden(isShowingHomeView)
            .onAppear {
                self.isShowingHomeView = true
            }
        }
        
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
