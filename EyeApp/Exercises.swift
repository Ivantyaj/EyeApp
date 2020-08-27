//
//  Exercises.swift
//  EyeApp
//
//  Created by Macintosh on 6/29/20.
//  Copyright © 2020 IVDEV. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct Exercises: View {
    
    var body: some View {
        VStack {
            if !exTest.isEmpty{
                ScrollView{
                    ForEach(exTest) { exData in
                        if exData.isShow {
                            NavigationLink(destination: CarouselView(navBarTitle: exData.name, dataCard: exData.cards)) {
                                ButtonView(title: exData.name)
                            }
                        }
                    }
                }
            }
            AdBannerView()
        }
        .navigationBarTitle("Упражнения")
    }
    
//    func fetchData() {
//        Firestore.firestore().collection("exercises")
//            .addSnapshotListener { querySnapshot, error in
//                guard let documents = querySnapshot?.documents else {
//                    print("Error fetching document: \(error!)")
//                    return
//                }
//
//                for document in documents {
//                    print("\(document.documentID) => \(document.data())")
//
//                    let name = document.data()["name"] as? String ?? ""
//                    let isShow = document.data()["isShow"] as? Bool ?? false
//                    let cardsId = document.data()["cardsId"] as? [String] ?? []
//
//                    self.exTest.append(ExercisesData(id: document.documentID, name: name, isShow: isShow, cardsId: cardsId))
//
//                }
//        }
//
//    }
}

struct Exercises_Previews: PreviewProvider {
    static var previews: some View {
        Exercises()
    }
}
