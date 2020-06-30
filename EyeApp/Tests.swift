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
            HStack {
                NavigationLink(destination: AmslerTest()) {
                    SquareButton()
                }
                NavigationLink(destination: AmslerTest()) {
                    SquareButton()
                }
            }
            
            HStack {
                NavigationLink(destination: AmslerTest()) {
                    SquareButton()
                }
                NavigationLink(destination: AmslerTest()) {
                    SquareButton()
                }
            }
            
            HStack {
                NavigationLink(destination: AmslerTest()) {
                    SquareButton()
                }
                NavigationLink(destination: AmslerTest()) {
                    SquareButton()
                }
                
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
