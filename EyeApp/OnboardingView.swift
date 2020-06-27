//
//  ContentView.swift
//  EyeApp
//
//  Created by Macintosh on 6/25/20.
//  Copyright © 2020 IVDEV. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
    
    @State private var step = 1
    @State private var SlideGesture = CGSize.zero
    @State private var isHomeView = false
    
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
                                .animation(Animation.interpolatingSpring(stiffness: 25, damping: 7).delay(0.1))
                        }
                        .frame(width: geometry.frame(in: .global).width)
                        
                        VStack (spacing: 35) {
                            Image("P2")
                                .resizable()
                            Text("Глазобилдер")
                                .padding()
                                .fixedSize(horizontal: false, vertical: true)
                                .animation(Animation.interpolatingSpring(stiffness: 25, damping: 7).delay(0.1))
                        }
                        .frame(width: geometry.frame(in: .global).width)
                        
                        VStack (spacing: 35) {
                            Image("P3")
                                .resizable()
                            Text("Будешь видеть с километра")
                                .padding()
                                .fixedSize(horizontal: false, vertical: true)
                                .animation(Animation.interpolatingSpring(stiffness: 25, damping: 7).delay(0.1))
                        }
                        .frame(width: geometry.frame(in: .global).width)
                    }
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("Light"))
                    .font(.title).padding(.vertical, 60)
                    .frame(width: geometry.frame(in: .global).width * 3)
                    .frame(maxHeight: .infinity)
                    .offset(x: self.SlideGesture.width)
                    .offset(x: self.step == 1 ? geometry.frame(in: .global).width : self.step == 2 ? 0 : -geometry.frame(in: .global).width)
                    .animation(Animation.interpolatingSpring(stiffness: 40, damping: 8))
                }
                .gesture(
                    DragGesture().onChanged { value in
                        self.SlideGesture = value.translation
                    }
                    .onEnded { value in
                        if self.SlideGesture.width < -150 {
                            switch self.step {
                            case 1:
                                self.step = 2
                            case 2:
                                self.step = 3
                            default: break
                            }
                        }
                        if self.SlideGesture.width > 150 {
                            switch self.step {
                            case 3:
                                self.step = 2
                            case 2:
                                self.step = 1
                            default: break
                            }
                        }
                        self.SlideGesture = .zero
                    }
                )
                HStack(spacing: 20){
                    Button(action: {
                        self.step = 1
                    }) {
                        Image(systemName: "1.circle")
                            .padding()
                            .scaleEffect(step == 1 ? 1 : 0.65)
                    }
                    Button(action: {
                        self.step = 2
                    }) {
                        Image(systemName: "2.circle")
                            .padding()
                            .scaleEffect(step == 2 ? 1 : 0.65)
                    }
                    Button(action: {
                        self.step = 3
                    }) {
                        Image(systemName: "3.circle")
                            .padding()
                            .scaleEffect(step == 3 ? 1 : 0.65)
                    }
                }
                .animation(.spring(response: 0.4, dampingFraction: 0.5))
                .font(.largeTitle)
                .accentColor(Color("Light"))
                
                Button(action: {
                    self.isHomeView = true
                }) {
                    HStack {
                        Text("Продолжить")
                        Image(systemName: "chevron.right")
                    }
                    .padding(.horizontal)
                    .padding()
                    .background(Capsule().fill(Color("ButtonColor")))
                    .accentColor((Color("Light")))
                    .opacity(step == 3 ? 1 : 0)
                    .animation(.none)
                    .scaleEffect(step == 3 ? 1 : 0.01)
                    .animation(Animation.interpolatingSpring(stiffness: 50, damping: 10, initialVelocity: 10))
                }
            }
            if self.isHomeView {
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
