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
                ForEach(ex) { exData in
                    NavigationLink(destination: CarouselView(navBarTitle: exData.name, data: exData.cards)) {
                        ButtonView(title: exData.name)
                    }
                }
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
