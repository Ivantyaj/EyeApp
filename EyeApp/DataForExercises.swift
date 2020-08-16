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

class ExViewModel: ObservableObject{
    @Published var exData : [ExercisesData] = []
    @Published var taskData : [TaskCard] = []
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        isGetExData = false
        let rootCollection = db.collection("exercises")
        
        var ex : [ExercisesData] = []
        
        rootCollection.getDocuments() { (querySnapshot, err) in
            
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    
                    let name = document.data()["name"] as? String ?? ""
                    let isShow = document.data()["isShow"] as? Bool ?? false
                    let cardsId = document.data()["cardsId"] as? [String] ?? []
                    
                    ex.append(ExercisesData(id: document.documentID, name: name, isShow: isShow, cardsId: cardsId))
                    
                }
                isGetExData = true
                DispatchQueue.main.async {
                    self.exData = ex
                    print(ex)
                }
                
            }
            
        }
        
    }
    
    func fetchDataPop2(){
        Firestore.firestore().collection("exercises")
            .addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("Error fetching document: \(error!)")
                    return
                }
                
                for document in documents {
                    print("\(document.documentID) => \(document.data())")
                    
                    let name = document.data()["name"] as? String ?? ""
                    let isShow = document.data()["isShow"] as? Bool ?? false
                    let cardsId = document.data()["cardsId"] as? [String] ?? []
                    
                    DispatchQueue.main.async {
                        self.exData.append(ExercisesData(id: document.documentID, name: name, isShow: isShow, cardsId: cardsId))
                    }
                    
                    
                    print("I was HERERERERERERE")
                    print(self.exData)
                    self.objectWillChange.send()
                }
                
        }
    }
    
    
    func fetchDataTaskCards(taskIds : [String]) {
        let rootCollection = db.collection("taskCards")
        
        for id in taskIds {
            rootCollection.document(id).getDocument { (document, error) in
                if let document = document, document.exists {
                    
                    let data = document.data()!
                    
                    let img = data["img"] as! String
                    
                    let name = data["name"] as! String
                    let show = data["show"] as! Bool
                    
                    print("Document data: \(data)")
                    
                    self.taskData.append(TaskCard(id: document.documentID, img: img, name: name, show: show))
                    
                    
                } else {
                    print("Document does not exist")
                }
            }
        }
        
        
        rootCollection.getDocuments() { (querySnapshot, err) in
            
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    
                    
                    let name = document.data()["name"] as! String
                    let isShow = document.data()["isShow"] as! Bool
                    let cardsId = document.data()["cardsId"] as! [String]
                    
                    ex.append(ExercisesData(id: document.documentID, name: name, isShow: isShow, cardsId: cardsId))
                    
                }
                
                print(ex)
            }
        }
        
    }
    
}


