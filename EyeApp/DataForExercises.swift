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
    
    private var db = Firestore.firestore()
    
    init(name: String, cards: [TaskCard], isShow: Bool = true) {
        self.name = name
        self.cards = cards
        self.isShow = true
    }
    
    init(id: String, name: String, isShow: Bool) {
        self.id = id
        self.name = name
        self.isShow = isShow
        
        var cardsS : [TaskCard] = []
        db.collection("exercises").document(id).collection("cards").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) =INNER> \(document.data())")
                    
                    let img = document.data()["img"] as! String
                    let name = document.data()["name"] as! String
                    let show =  document.data()["show"] as! Bool
                    
                    cardsS.append(TaskCard(id: document.documentID, img: img, name: name, show: show))
                    
                }
            }
        }
        
        self.cards = cardsS

    }
}

class ExViewModel: ObservableObject{
    @Published var exData = [ExercisesData]()
    
    private var db = Firestore.firestore()
    
//    func completeList(completion: @escaping (Bool, [ExercisesData]) -> ()){
//        let tasks = [ExercisesData]()
//        db.collection("exercises ").getDocuments() { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//                completion(false, tasks)
//            } else {
//                for document in querySnapshot!.documents {
//                    print("\(document.documentID) => \(document.data())")
//                }
//                completion(true, tasks)
//            }
//        }
//    }
    
 
    
    func fetchData() {
        let rootCollection = db.collection("exercises")
//
//        db.collection("exercises").document("ybFpuTH3hiTUaivqDSZy").collection("cards").getDocuments() { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                for document in querySnapshot!.documents {
//                    print("\(document.documentID) => \(document.data())")
//                }
//            }
//        }
        
        
//        var docIds : [String] = []
        
        var ex : [ExercisesData] = []
        
        
        rootCollection.getDocuments() { (querySnapshot, err) in
            
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    
//                    docIds.append(document.documentID)
                    
                    let name = document.data()["name"] as! String
                    let isShow = document.data()["isShow"] as! Bool
                    
//                    var task : [TaskCard] = []
//
//                    rootCollection.document(document.documentID).collection("cards").getDocuments() { (querySnapshot, err) in
//                        if let err = err {
//                            print("Error getting documents: \(err)")
//                        } else {
//                            for document in querySnapshot!.documents {
//                                print("\(document.documentID) =INNER> \(document.data())")
//
//                                let img = document.data()["img"] as! String
//                                let name = document.data()["name"] as! String
//                                let show =  document.data()["show"] as! Bool
//
//                                task.append(TaskCard(id: document.documentID, img: img, name: name, show: show))
//
//                            }
//                        }
//                    }
                    
                    ex.append(ExercisesData(id: document.documentID, name: name, isShow: isShow))
                    
                }
                
                print(ex)
            }
        }
        
//        for id in docIds {
//
//            db.collection("exercises").document(id).collection("cards").getDocuments() { (querySnapshot, err) in
//                if let err = err {
//                    print("Error getting documents: \(err)")
//                } else {
//                    for document in querySnapshot!.documents {
//                        print("\(document.documentID) => ID \(document.data())")
//                    }
//                }
//            }
//
//        }
        

        
//        db.collection("taskCards").getDocuments() { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                for document in querySnapshot!.documents {
//                    print("\(document.documentID) => \(document.data())")
//                }
//            }
//        }
        
//        db.collection("exercises").addSnapshotListener { (querySnapshot, error) in
//            
//            if let error = error {
//                print("Error: \(error)")
//                return
//            }
////            guard let snapshot = querySnapshot else {
////                  print("Error fetching snapshots: \(error!)")
////                  return
////              }
//            
//            guard let documents = querySnapshot?.documents else {
//                print("No documents")
//                return
//            }
//            
////            self.exData = documents.compactMap({ (queryDocumentSnapshot) -> ExercisesData? in
////                return try? queryDocumentSnapshot.data(as: ExercisesData.self)
////            })
//    
//            
//            
//            self.exData = documents.map { (queryDocumentSnapshot) -> ExercisesData in
//            
//                
//                let data = queryDocumentSnapshot.data()
//                
//                print("\(queryDocumentSnapshot.documentID) => \(queryDocumentSnapshot.data())")
//
//                let name = data["name"] as? String ?? ""
//                let isShow = data["isShow"] as? Bool ?? false
////                let cards = queryDocumentSnapshot.docu
//                
//
////                let people = queryDocumentSnapshot.data()["cards"]! as! [TaskCard]
////                print(people[0])
//                
//
//
//                
//                if let contentModels = data["cards"] as? [AnyObject] as? [TaskCard] {
//                    for contentModel in contentModels {
//                        print(contentModel)
//                    }
//                }
//                
////                let cards = data["cards"] as? [TaskCard]
////                FIX IT
//                let exercise = ExercisesData(name: name, cards: cards as! [TaskCard], isShow: isShow)
//
//                return exercise
//            }
//            
//        }
    }
    
    
    func getData() {
        let rootCollection = db.collection("exercises")

        var data = [Any]()

        rootCollection.getDocuments() {

            (querySnapshot, error) in

            if error != nil {
                print("Error when getting data \(String(describing: error?.localizedDescription))")
            } else {
                guard let topSnapshot = querySnapshot?.documents else { return }
                for category in topSnapshot {
                    rootCollection.document(category.documentID).collection("cards").getDocuments() {
                        (snapshot, err) in

                        guard let snapshot = snapshot?.documents else { return }

                        var questions = [TaskCard]()

                        for document in snapshot {
                            let title = document.data()["img"] as! String
                            let details = document.data()["name"] as! String
                            let article = document.data()["show"] as! Bool

                            let newQuestion = TaskCard(img: title, name: details, show: article)


                            questions.append(newQuestion)

                        }
                        let categoryTitle = category.data()["name"] as! String
                        let collectionID = category.data()["isShow"] as! Bool

                        let newCategory = ExercisesData(name: categoryTitle, cards: questions, isShow: collectionID)
    
                        data.append(newCategory)

                        //Return data on completion
                        
                    }
                }
                self.exData = data as! [ExercisesData]
            }
        }
        
        
    }

}


