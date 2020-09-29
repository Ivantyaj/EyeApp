//
//  HomeView20.swift
//  EyeApp
//
//  Created by Macintosh on 9/29/20.
//  Copyright © 2020 IVDEV. All rights reserved.
//

import SwiftUI

struct HomeView20: View {
    var body: some View {
        NavigationView {
            VStack{
                
                HStack {
                    Text("Упражнения")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }.padding()
                
                if !exTest.isEmpty{
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack (spacing: 5) {
                            ForEach(exTest) { exData in
                                if exData.isShow {
                                    NavigationLink(destination: CarouselView(navBarTitle: exData.name, dataCard: exData.cards)) {
                                        ButtonView(title: exData.name)
                                    }
                                    .navigationBarTitle(Text("Назад"))
                                    .navigationBarHidden(true)
                                }
                            }
                            ForEach(exTest) { exData in
                                if exData.isShow {
                                    NavigationLink(destination: CarouselView(navBarTitle: exData.name, dataCard: exData.cards)) {
                                        ButtonView(title: exData.name)
                                    }
                                    .navigationBarTitle(Text("Назад"))
                                    .navigationBarHidden(true)
                                }
                            }
                        }
                        .padding([.leading, .bottom, .trailing])
                        
                        
                    }
                    
                } else {
                    Text("Не удалось загрузить данные")
                }
                
                Spacer()
                
                AdBannerView()
            }
        }
        
//        .navigationBarBackButtonHidden(true)
        
    }
}

struct HomeView20_Previews: PreviewProvider {
    static var previews: some View {
        HomeView20().onAppear(){
            
        }
    }
}
