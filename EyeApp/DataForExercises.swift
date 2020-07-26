//
//  DataForExercises.swift
//  EyeApp
//
//  Created by Macintosh on 7/25/20.
//  Copyright © 2020 IVDEV. All rights reserved.
//

import Foundation


var dataFirstExersise = [
    
    TaskCard(id: 0, img: "EXG3", name: "Води глазами туда-сюда\nКрайнe полезное упражнение и вот это вот все", show: false),
    TaskCard(id: 1, img: "EXG4", name: "По углам резко", show: false),
    TaskCard(id: 2, img: "EXG5", name: "Восьмёрочкой", show: false)
    
]

var ex = [
          ExercisesData(id: 0, name: "Гимнастика", cards: dataFirstExersise),
          ExercisesData(id: 1, name: "Расслабление", cards: dataFirstExersise),
          ExercisesData(id: 2, name: "Упражнение 3", cards: dataFirstExersise, isShow: false),
          ExercisesData(id: 3, name: "Упражнение 4", cards: dataFirstExersise),
]

struct ExercisesData : Identifiable {
    var id : Int
    var name : String
    var cards : [TaskCard]
    var isShow = true
}

