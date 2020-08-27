//
//  DataForExercises.swift
//  EyeApp
//
//  Created by Macintosh on 7/25/20.
//  Copyright © 2020 IVDEV. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

var isGetExData = false

var dataFirstExersise = [
    
    TaskCard(img: "EXG3", name: "Води глазами туда-сюда\nКрайнe полезное упражнение и вот это вот все", show: false),
    TaskCard(img: "EXG4", name: "По углам резко", show: false),
    TaskCard(img: "EXG5", name: "Восьмёрочкой", show: false)
    
]

var ex = [
    ExercisesData(name: "Гимнастика", cards: dataFirstExersise),
    ExercisesData(name: "Расслабление", cards: dataFirstExersise),
    ExercisesData(name: "Упражнение 3", cards: dataFirstExersise, isShow: true),
    ExercisesData(name: "Упражнение 4", cards: dataFirstExersise),
    ExercisesData(name: "Упражнение 5", cards: dataFirstExersise),
]

struct ExercisesData : Identifiable {
    @DocumentID var id : String? = UUID().uuidString
    //    var id : Int = UUID().hashValue
    var name : String
    var cards : [TaskCard] = []
    
    var isShow = true
    
    var cardsId : [String] = []
}



var exTest : [ExercisesData] = []

class FetchingData: ObservableObject {
    
    @Published var isFetchData = false
    
    func fetchExercisesButtonData(){
        Firestore.firestore().collection("exercisesWithTask")
            .addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("Error fetching document: \(error!)")
                    return
                }
                
                for document in documents {
                    print("\(document.documentID) => \(document.data())")
                    
                    let name = document.data()["name"] as? String ?? ""
                    let isShow = document.data()["isShow"] as? Bool ?? false
                    
                    let cards = document.data()["cards"] as? [[String:Any]]
                    
                    var taskCards : [TaskCard] = []
                    
                    for card in cards! {
                        let nameT = card["name"] as? String ?? ""
                        let imgT  = card["img"] as? String ?? ""
                        let showT = card["show"] as? Bool ?? false
                        
                        taskCards.append(TaskCard(img: imgT, name: nameT, show: showT))
                    }
                    
                    exTest.append(ExercisesData(id: document.documentID, name: name, cards: taskCards, isShow: isShow))
                    print(exTest)
                    self.isFetchData = true
                    
                }
        }
        
    }
    
}
