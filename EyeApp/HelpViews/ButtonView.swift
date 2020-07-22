//
//  ButtonView.swift
//  EyeApp
//
//  Created by Macintosh on 7/22/20.
//  Copyright © 2020 IVDEV. All rights reserved.
//

import SwiftUI

struct ButtonView: View {
    
    var title : String
    var textColor : Color = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    var gradient : [Color] = [Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)),Color(#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1))]
    
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: .init(colors: self.gradient), startPoint: .top, endPoint: .bottom)
                .frame(height: 180)
                .clipShape(CShape())
                .cornerRadius(15)
            Text(title)
                .foregroundColor(textColor)
                .font(.largeTitle)
                .bold()
        }
    }
}

struct Gradient : Decodable{
    var name : String
    var colors : [String]
}

struct CShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topRight,.bottomLeft], cornerRadii: CGSize(width: 55, height: 55))
        
        return Path(path.cgPath)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Test title")
        //            .preferredColorScheme(.dark)
    }
}
