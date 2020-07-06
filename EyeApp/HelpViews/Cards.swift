//
//  Cards.swift
//  EyeApp
//
//  Created by Macintosh on 7/3/20.
//  Copyright © 2020 IVDEV. All rights reserved.
//

import Foundation

struct Card {
    let id: Int
    let image: String
    let question: [String]
    var answer: String = ""
}
//Card(id: , image: "D", question: ["","","",""]),
var cards = [Card(id: 1, image: "D1", question: ["6","96","9", "Ничего не вижу"]),
             Card(id: 2, image: "D2", question: ["Круг","Круг и треугольник","Треугольник","Ничего не вижу"]),
             Card(id: 3, image: "D3", question: ["5","9","",""]),
             Card(id: 4, image: "D4", question: ["Треугольник","Круг","",""]),
             Card(id: 5, image: "D5", question: ["13","6","",""]),
             Card(id: 6, image: "D6", question: ["Круг и треугольник","Ничего не вижу","",""]),
//             Card(id: 7, image: "D7", question: ["6","96","",""]),
//             Card(id: 8, image: "D8", question: ["Ничего не вижу","5","",""]),
//             Card(id: 9, image: "D9", question: ["9","6","8",""]),
//             Card(id: 10, image: "D10", question: ["136","66","68","69"]),
//    Card(id: 11, image: "D11", question: ["Треугольник","Круг и треугольник","Круг",""]),
//    Card(id: 12, image: "D12", question: ["12","Ничего не вижу","",""]),
//    Card(id: 13, image: "D13", question: ["Круг и треугольник","Круг","Треугольник",""]),
//    Card(id: 14, image: "D14", question: ["30","10","Другое",""]),
///    Card(id: 15, image: "D15", question: ["Круг слева, треугольник справа","Слева треугольник, внизу квадрат","2 трекгольника, внизу квадрат",""]),
//    Card(id: 16, image: "D16", question: ["96","6","9",""]),
//    Card(id: 17, image: "D17", question: ["Треугольник","Треугольник и круг","Круг",""]),
///    Card(id: 18, image: "D18", question: ["Одноцветные - вертикальные","Одноцветные - горизонтальные","",""]),
//    Card(id: 19, image: "D19", question: ["5","95","",""]),
//    Card(id: 20, image: "D20", question: ["Круг и треугольник","Ничего не вижу","",""]),
///    Card(id: 21, image: "D21", question: ["Одноцветные - горизонталь5ные","Одноцветные - вертикальные","",""]),
//    Card(id: 22, image: "D22", question: ["6","66","",""]),
//    Card(id: 23, image: "D23", question: ["36","6","Ничего не вижу",""]),
//    Card(id: 24, image: "D24", question: ["14","Ничего не вижу","",""]),
//    Card(id: 25, image: "D25", question: ["9","Ничего не вижу","",""]),
//    Card(id: 26, image: "D26", question: ["4","Ничего не вижу","",""]),
//    Card(id: 27, image: "D27", question: ["13","Ничего не вижу","",""]),
]

struct Answer {
    let questionNum: Int
    let answers : [String]
}

//Answer(questionNum: , answers: [""]),
let normal = [Answer(questionNum: 1, answers: ["96"]),
              Answer(questionNum: 2, answers: ["Круг и треугольник"]),
              Answer(questionNum: 3, answers: ["9"]),
              Answer(questionNum: 4, answers: ["Треугольник"]),
              Answer(questionNum: 5, answers: ["13"]),
              Answer(questionNum: 6, answers: ["Круг и треугольник"]),
//              Answer(questionNum: 7, answers: [""]),
//              Answer(questionNum: 8, answers: [""]),
//              Answer(questionNum: 9, answers: [""]),
//              Answer(questionNum: 10, answers: [""]),
//              Answer(questionNum: 11, answers: [""]),
//              Answer(questionNum: 12, answers: [""]),
//              Answer(questionNum: 13, answers: [""]),
//              Answer(questionNum: 14, answers: [""]),
//              Answer(questionNum: 15, answers: [""]),
//              Answer(questionNum: 16, answers: [""]),
//              Answer(questionNum: 17, answers: [""]),
//              Answer(questionNum: 18, answers: [""]),
//              Answer(questionNum: 19, answers: [""]),
//              Answer(questionNum: 20, answers: [""]),
//              Answer(questionNum: 21, answers: [""]),
//              Answer(questionNum: 22, answers: [""]),
//              Answer(questionNum: 23, answers: [""]),
//              Answer(questionNum: 24, answers: [""]),
//              Answer(questionNum: 25, answers: [""]),
//              Answer(questionNum: 26, answers: [""]),
//              Answer(questionNum: 27, answers: [""]),
]

let protanope = [Answer(questionNum: 1, answers: ["96"]),
              Answer(questionNum: 2, answers: ["Круг"]),
              Answer(questionNum: 3, answers: ["5"]),
              Answer(questionNum: 4, answers: ["Круг"]),
              Answer(questionNum: 5, answers: ["6"]),
              Answer(questionNum: 6, answers: ["Ничего не вижу"]),
//              Answer(questionNum: 7, answers: [""]),
//              Answer(questionNum: 8, answers: [""]),
//              Answer(questionNum: 9, answers: [""]),
//              Answer(questionNum: 10, answers: [""]),
//              Answer(questionNum: 11, answers: [""]),
//              Answer(questionNum: 12, answers: [""]),
//              Answer(questionNum: 13, answers: [""]),
//              Answer(questionNum: 14, answers: [""]),
//              Answer(questionNum: 15, answers: [""]),
//              Answer(questionNum: 16, answers: [""]),
//              Answer(questionNum: 17, answers: [""]),
//              Answer(questionNum: 18, answers: [""]),
//              Answer(questionNum: 19, answers: [""]),
//              Answer(questionNum: 20, answers: [""]),
//              Answer(questionNum: 21, answers: [""]),
//              Answer(questionNum: 22, answers: [""]),
//              Answer(questionNum: 23, answers: [""]),
//              Answer(questionNum: 24, answers: [""]),
//              Answer(questionNum: 25, answers: [""]),
//              Answer(questionNum: 26, answers: [""]),
//              Answer(questionNum: 27, answers: [""]),
]

let deiteranope = [Answer(questionNum: 1, answers: ["96"]),
              Answer(questionNum: 2, answers: ["Треугольник"]),
              Answer(questionNum: 3, answers: ["5"]),
              Answer(questionNum: 4, answers: ["Круг"]),
              Answer(questionNum: 5, answers: ["6"]),
              Answer(questionNum: 6, answers: ["Ничего не вижу"]),
//              Answer(questionNum: 7, answers: [""]),
//              Answer(questionNum: 8, answers: [""]),
//              Answer(questionNum: 9, answers: [""]),
//              Answer(questionNum: 10, answers: [""]),
//              Answer(questionNum: 11, answers: [""]),
//              Answer(questionNum: 12, answers: [""]),
//              Answer(questionNum: 13, answers: [""]),
//              Answer(questionNum: 14, answers: [""]),
//              Answer(questionNum: 15, answers: [""]),
//              Answer(questionNum: 16, answers: [""]),
//              Answer(questionNum: 17, answers: [""]),
//              Answer(questionNum: 18, answers: [""]),
//              Answer(questionNum: 19, answers: [""]),
//              Answer(questionNum: 20, answers: [""]),
//              Answer(questionNum: 21, answers: [""]),
//              Answer(questionNum: 22, answers: [""]),
//              Answer(questionNum: 23, answers: [""]),
//              Answer(questionNum: 24, answers: [""]),
//              Answer(questionNum: 25, answers: [""]),
//              Answer(questionNum: 26, answers: [""]),
//              Answer(questionNum: 27, answers: [""]),
]

//struct Answers {
//    let check       = [1"96",2"Круг и треугольник",3"z",4"z",5"",6"",7"",8"",9"",10"",11"",12"",13"",14"",15"",16"",17"",18"",19"",20"",21"",22"",23"",24"",25"",26"",27""]
//    let normal      = [1"96",2"Круг и треугольник",3"9",4"Треугольник",5"13",6"Круг и треугольник",7"96",8"5",9"9",10"",11"",12"",13"",14"",15"",16"",17"",18"",19"",20"",21"",22"",23"",24"",25"",26"",27""]
//    let protanope   = [1"96",2"Круг и треугольник",3"5",4"Круг",5"6",6"Ничего не вижу",7"96",8"Ничего не вижу",9"6 или 8",10"",11"",12"",13"",14"",15"",16"",17"",18"",19"",20"",21"",22"",23"",24"",25"",26"",27""]
//    let deiteranope = [1"96",2"Круг и треугольник",3"5",4"Круг",5"6",6"Ничего не вижу",7"6",8"Ничего не вижу",9"9",10"",11"",12"",13"",14"",15"",16"",17"",18"",19"",20"",21"",22"",23"",24"",25"",26"",27""]
//    let anusual     = [1"96",2"Круг и треугольник",3"z",4"z",5"",6"",7"",8"",9"",10"",11"",12"",13"",14"",15"",16"",17"",18"",19"",20"",21"",22"",23"",24"",25"",26"",27""]
//}

func check(answers: [Answer], normalAnswers: [Answer], protanopeAnswers: [Answer], deiteranopeAnswers: [Answer]) -> (normal:Int,protanope:Int,deiteranope:Int) {

    var normal      = 0
    var protanope   = 0
    var deiteranope = 0
    
    
    for i in 0..<answers.count {
        switch answers[i].answers {
        case normalAnswers[i].answers:
            normal += 1
        case protanopeAnswers[i].answers:
            protanope += 1
        case deiteranopeAnswers[i].answers:
            deiteranope += 1
        default:
            print("ERROR")
        }
    }
    
    return (normal,protanope,deiteranope)
}
