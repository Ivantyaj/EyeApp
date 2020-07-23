//
//  Tests.swift
//  EyeApp
//
//  Created by Macintosh on 6/29/20.
//  Copyright © 2020 IVDEV. All rights reserved.
//

import SwiftUI

struct Tests: View {
    var body: some View {
        VStack {
            
            NavigationLink(destination: AmslerTest()) {
                //                    SquareButton(title: "Тест Амслера")
                ButtonView(title: "Тест Амслера", textColor: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), gradient: [Color(#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)),Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))])
            }
            NavigationLink(destination: DaltonismTest()) {
                ButtonView(title: "Тест на дальтонизм", textColor: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), gradient: [Color(#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)),Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))])
            }
            NavigationLink(destination: DaltonismTest()) {
                ButtonView(title: "Тест", textColor: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), gradient: [Color(#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)),Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))])
            }
            NavigationLink(destination: DaltonismTest()) {
                ButtonView(title: "Тест", textColor: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), gradient: [Color(#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)),Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))])
            }
            
        }
        .navigationBarTitle("Тесты")
    }
}

struct Tests_Previews: PreviewProvider {
    static var previews: some View {
        Tests()
            
    }
}
