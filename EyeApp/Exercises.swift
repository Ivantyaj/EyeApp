//
//  Exercises.swift
//  EyeApp
//
//  Created by Macintosh on 6/29/20.
//  Copyright © 2020 IVDEV. All rights reserved.
//

import SwiftUI

struct Exercises: View {
    
    @ObservedObject private var viewModel = ExViewModel()
    
    var body: some View {
        VStack {
            ScrollView{
                ForEach(viewModel.exData) { exData in
                    if exData.isShow {
                        NavigationLink(destination: CarouselView(navBarTitle: exData.name, data: exData.cards)) {
                            ButtonView(title: exData.name)
                        }
                    }
                }
            }
            AdBannerView()
        }
        .navigationBarTitle("Упражнения")
        .onAppear(){
            self.viewModel.fetchData()
//            self.viewModel.completeList(completion: { (status, tasks) in
//                print(status)
//            })
//            self.viewModel.getData()
            
        }
    }
}

struct Exercises_Previews: PreviewProvider {
    static var previews: some View {
        Exercises()
    }
}
