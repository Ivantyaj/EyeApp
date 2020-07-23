//
//  DaltonismCard.swift
//  EyeApp
//
//  Created by Macintosh on 7/1/20.
//  Copyright © 2020 IVDEV. All rights reserved.
//

import SwiftUI

struct DaltonismCard: View {
    
    @State private var selectedRow = 0
    
    //    var image : String
    //    var question : [String]
    
    var card : Card
    
    @Binding var selected : String
    @Binding var nextCardToggled : Bool
    
    var body: some View {
        VStack {

          
            VStack {
                
//                if self.nextCardToggled {
//                    Text(selected)
//                }
                
                Image(card.image).resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text("Что вы видите на картинке?")
                    .font(.system(size: 25))
                
            }

            
            //            RadioButtons(data: card.question, selected: self.$selected, show: self.$nextCardToggled)
            
            VStack(alignment: .leading, spacing: 15) {
                ForEach(card.question, id: \.self){i in
                    Button(action: {
                        self.selected = i
                    }) {
                        HStack{
                            if (i != "") {
                                Text(i)
                                    .font(.system(size: 20))
                                
                                Spacer()
                                
                                ZStack {
                                    Circle()
                                        .fill(self.selected == i ? Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 0.5)): Color.black.opacity(0.2))
                                        .frame(width: 25, height: 25)
                                    
                                    if self.selected == i {
                                        Circle().stroke(Color(#colorLiteral(red: 0, green: 0.9273002148, blue: 0.2516316175, alpha: 1)), lineWidth: 4)
                                            .frame(width: 25, height: 25)
                                    }
                                }
                            }
                        }
                        .frame(height: 10)
                        .foregroundColor(.black)
                    }
                    .padding(.top)
                }
                
                HStack(){
                    Spacer()
                }
//                HStack(){
//                    Spacer()
//                    Button(action: {
//                        //self.show = self.selected != "" ? true : false
//                        self.nextCardToggled.toggle()
//                        
//                    }) {
//                        Text("Продолжить")
//                            .padding(.vertical)
//                            .padding(.horizontal, 25)
//                            .foregroundColor(.white)
//                    }
//                    .background(
//                        self.selected != "" ? Color(#colorLiteral(red: 0, green: 0.9273002148, blue: 0.2516316175, alpha: 1)) : Color(#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1))
//                    )
//                        .clipShape(Capsule())
//                        .disabled(self.selected != "" ? false : true)
//                }
                
            }
//            .padding(.vertical)
            .padding(.horizontal, 25)
            .background(Color(#colorLiteral(red: 0.9131513834, green: 0.907723248, blue: 0.9173240066, alpha: 0.5)))
            .cornerRadius(25)
        }
        .padding(.horizontal)
    }
}

struct DaltonismCard_Previews: PreviewProvider {
    static var previews: some View {
        DaltonismCard(card: Card(id: 1, image: "D1", question: ["1111","2222","3333",]), selected: .constant(""), nextCardToggled: .constant(false))
    }
}
