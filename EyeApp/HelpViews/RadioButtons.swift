//
//  RadioButtons.swift
//  EyeApp
//
//  Created by Macintosh on 7/1/20.
//  Copyright © 2020 IVDEV. All rights reserved.
//

import SwiftUI

var dataTest = ["Test1", "Test2", "Test3"]

struct RadioButtons: View {
    var data : [String]
    
    @Binding var selected : String
    @Binding var show : Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(data, id: \.self){i in
                Button(action: {
                    self.selected = i
                }) {
                    HStack{
                        Text(i)
                        Spacer()
                        
                        ZStack {
                            Circle()
                                .fill(self.selected == i ? Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 0.5)): Color.black.opacity(0.2))
                                .frame(width: 18, height: 18)
                            
                            if self.selected == i {
                                Circle().stroke(Color(#colorLiteral(red: 0, green: 0.9273002148, blue: 0.2516316175, alpha: 1)), lineWidth: 4)
                                .frame(width: 25, height: 25)
                            }
                        }
                        
                    }
                    .foregroundColor(.black)
                }
                .padding(.top)
            }
            
            HStack{
                Spacer()
                Button(action: {
                    self.show.toggle()
                }) {
                    Text("Продолжить")
                        .padding(.vertical)
                        .padding(.horizontal, 25)
                        .foregroundColor(.white)
                }
                .background(
                    self.selected != "" ? Color(#colorLiteral(red: 0, green: 0.9273002148, blue: 0.2516316175, alpha: 1)) : Color(#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1))
                )
                .clipShape(Capsule())
                    .disabled(self.selected != "" ? false : true)
            }
        }
        .padding(.vertical)
        .padding(.horizontal, 25)
        .background(Color(#colorLiteral(red: 0.9131513834, green: 0.907723248, blue: 0.9173240066, alpha: 0.5)))
        .cornerRadius(25)
    }
}

struct RadioButtons_Previews: PreviewProvider {
    static var previews: some View {
        RadioButtons(data: dataTest, selected: .constant(""), show: .constant(false))
    }
}
