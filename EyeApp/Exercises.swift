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
            HStack {
                NavigationLink(destination: CarouselView(title: "Гимнастика для глаз")) {
                    SquareButton(title: "Гимнастика")
                }
                NavigationLink(destination: DaltonismTest()) {
                    SquareButton(title: "Тренировка")
                }
            }
            
            HStack {
                NavigationLink(destination: AmslerTest()) {
                    SquareButton(title: "Test")
                }
                NavigationLink(destination: AmslerTest()) {
                    SquareButton(title: "Test")
                }
            }
            
            HStack {
                NavigationLink(destination: AmslerTest()) {
                    SquareButton(title: "Test")
                }
                NavigationLink(destination: CarouselView(title: "Гимнастика для глаз")) {
                    SquareButton(title: "Test")
                }
                
            }
        }
        .navigationBarTitle("Упражнения")
    }
}

struct Exercises_Previews: PreviewProvider {
    static var previews: some View {
        Exercises()
    }
}
