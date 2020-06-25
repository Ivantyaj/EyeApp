//
//  ContentView.swift
//  EyeApp
//
//  Created by Macintosh on 6/25/20.
//  Copyright © 2020 IVDEV. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var step = 1
    
    var body: some View {
        ZStack{
            Color("Baklajan")
                .edgesIgnoringSafeArea(.all)
            
            VStack (spacing: 25) {
                Text("Добро пожаловать")
                    .font(.largeTitle)
                    .foregroundColor(Color("Light"))
                    .padding(.top)
                Text("Твои глаза")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color("Light"))
                
                GeometryReader { geometry in
                    HStack {
                        VStack (spacing: 35) {
                            Image("P1")
                                .resizable()
                            Text("Твои глаза в твоих руках")
                                .padding()
                                .fixedSize(horizontal: false, vertical: true)
                                .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                        }
                        .frame(width: geometry.frame(in: .global).width)
                        
                        VStack (spacing: 35) {
                            Image("P2")
                                .resizable()
                            Text("Глазобилдер")
                                .padding()
                                .fixedSize(horizontal: false, vertical: true)
                                .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                        }
                        .frame(width: geometry.frame(in: .global).width)
                        
                        VStack (spacing: 35) {
                            Image("P3")
                                .resizable()
                            Text("Будешь видеть с километра")
                                .padding()
                                .fixedSize(horizontal: false, vertical: true)
                                .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                        }
                        .frame(width: geometry.frame(in: .global).width)
                    }
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("Light"))
                    .font(.title).padding(.vertical, 60)
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
