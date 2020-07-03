//
//  DaltonismTest.swift
//  EyeApp
//
//  Created by Macintosh on 7/1/20.
//  Copyright © 2020 IVDEV. All rights reserved.
//

import SwiftUI

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
//             Card(id: 5, image: "D5", question: ["13","6","",""]),
//             Card(id: 6, image: "D6", question: ["Круг и треугольник","Ничего не вижу","",""]),
//             Card(id: 7, image: "D7", question: ["6","96","",""]),
//             Card(id: 8, image: "D8", question: ["Ничего не вижу","5","",""]),
//             Card(id: 9, image: "D9", question: ["6","8","9",""]),
//             Card(id: 10, image: "D10", question: ["136","66","68","69"]),
]

struct DaltonismTest: View {
    
    @State private var answer = ""
    @State private var nextCardToggled = false
    @State private var navBarTitle = ""
    
    @State private var currentCard = 0
    
    @State private var answers : [String] = []
    
    var body: some View {
        VStack {
            if self.answer != ""{
                Text(answer)
            }
            
            ForEach(answers, id: \.self){ i in
                Text(i)
            }
            
            VStack {
                
                if currentCard < cards.count {
                    DaltonismCard(card: cards[currentCard], selected: self.$answer, nextCardToggled: self.$nextCardToggled)
                }
                
                Button(action: {
                    self.testFunc()
                    self.changeTitle()
                }) {
                    Text("Продолжить")
                        .padding(.vertical)
                        .padding(.horizontal, 25)
                        .foregroundColor(.white)
                }
                .background(
                    self.answer != "" ? Color(#colorLiteral(red: 0, green: 0.9273002148, blue: 0.2516316175, alpha: 1)) : Color(#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1))
                )
                    .clipShape(Capsule())
                    .disabled(self.answer != "" ? false : true)
//                ForEach(cards, id: \.id) { card in
//
//                    DaltonismCard(image: card.image, question: card.question, selected: self.$answer, nextCardToggled: self.$nextCardToggled)
//
//                }
            }
        }
        .navigationBarTitle(navBarTitle)
        .onAppear {
            self.changeTitle()
        }
    }
    
    func testFunc() -> Void {
        if answer != "" {
            answers.append(answer)
            answer = ""
            currentCard += 1
        }
    }
    
    func changeTitle() -> Void {
        if currentCard < cards.endIndex {
            navBarTitle = String(self.currentCard+1) + String("/") + String(cards.endIndex)
        } else {
            navBarTitle = "Итоги"
        }
    }
}



struct DaltonismTest_Previews: PreviewProvider {
    static var previews: some View {
        DaltonismTest()
    }
}
