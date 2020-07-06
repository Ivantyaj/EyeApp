//
//  DaltonismTest.swift
//  EyeApp
//
//  Created by Macintosh on 7/1/20.
//  Copyright © 2020 IVDEV. All rights reserved.
//

import SwiftUI

struct DaltonismTest: View {
    
    @State private var answer = ""
    @State private var nextCardToggled = false
    @State private var navBarTitle = ""
    
    @State private var currentCard = 0
    
    @State private var answers : [String] = []
    @State private var answersToCheck : [Answer] = []
    
    @State private var result : (Int, Int, Int) = (0, 0, 0)
    
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
                    
                    var answerList : [String] = []
                    answerList.append(self.answers[self.currentCard-1])

                    self.answersToCheck.append(Answer(questionNum: self.currentCard, answers: answerList))
                    
                    if self.currentCard >= cards.endIndex {
                        self.result = check(answers: self.answersToCheck, normalAnswers: normal, protanopeAnswers: protanope, deiteranopeAnswers: deiteranope)
                    }
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
            
            
            if currentCard >= cards.endIndex {
                Text("Normal = " + String(result.0))
                Text("Protanope = " + String(result.1))
                Text("Deiteranope = " + String(result.2))
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
