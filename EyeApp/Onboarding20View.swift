//
//  Onboarding20View.swift
//  EyeApp
//
//  Created by Macintosh on 9/29/20.
//  Copyright © 2020 IVDEV. All rights reserved.
//

import SwiftUI

var cardOnData = [OnboardingCardView(image: "P1", text: "Твои глаза в твоих руках"),
                  OnboardingCardView(image: "P2", text: "YEYEYEY"),
                  OnboardingCardView(image: "P3", text: "SHB SHB SHB")]

struct Onboarding20View: View {
    @State var selectedPage:Int = 0
    @State private var isHomeView = false
    
    var body: some View {
        ZStack {
            VStack{
                TabView(selection: $selectedPage){
                    OnboardingCardView(image: "P1", text: "Твои глаза в твоих руках").tag(0)
                    OnboardingCardView(image: "P2", text: "YEYEYEY").tag(1)
                    OnboardingCardView(image: "P3", text: "SHB SHB SHB").tag(2)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                if selectedPage < 2 {
                    Button(action: {
                        selectedPage += 1
                    }) {
                        HStack {
                            Text("Далее")
                            Image(systemName: "chevron.right")
                        }
                        .padding(.horizontal)
                        .padding()
                        .background(Capsule().fill(Color("ButtonColor")))
                        .accentColor((Color("Light")))
                    }.hidden()
                }
                
                if selectedPage == 2{
                    Button(action: {
                        self.isHomeView = true
                        UserDefaults.standard.set(true, forKey: "didLaunchBefore")
                    }) {
                        HStack {
                            Text("Продолжить")
                            Image(systemName: "chevron.right")
                        }
                        .padding(.horizontal)
                        .padding()
                        .background(Capsule().fill(Color("ButtonColor")))
                        .accentColor((Color("Light")))
                    }
                    .animation(.spring())
                }
            }
            if self.isHomeView {
                HomeView20()
            }
        }
    }
}

struct Onboarding20View_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding20View()
    }
}
