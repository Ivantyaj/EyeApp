//
//  Exercises.swift
//  EyeApp
//
//  Created by Macintosh on 6/29/20.
//  Copyright © 2020 IVDEV. All rights reserved.
//

import SwiftUI

struct Exercises: View {
    var body: some View {
        VStack {
            ScrollView{
                Spacer()
                NavigationLink(destination: CarouselView(title: "Гимнастика для глаз")) {
                    ButtonView(title: "Гимнастика")
                }
                NavigationLink(destination: DaltonismTest()) {
                    ButtonView(title: "Расслабление")
                }
                NavigationLink(destination: AdBannerView()) {
                    ButtonView(title: "Реклама")
                }
                
                Spacer()
            }
            AdBannerView()
        }
        .navigationBarTitle("Упражнения")
    }
}

struct Exercises_Previews: PreviewProvider {
    static var previews: some View {
        Exercises()
    }
}
