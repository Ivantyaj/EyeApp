//
//  SquareButton.swift
//  EyeApp
//
//  Created by Macintosh on 6/30/20.
//  Copyright © 2020 IVDEV. All rights reserved.
//

import SwiftUI

struct SquareButton: View {
    var title : String
    
    var body: some View {
        ZStack {
            Image("")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(Color(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 0.4459813784)))
                .cornerRadius(40)
            Text(title)
                .font(.largeTitle)
        }
    }
}

struct SquareButton_Previews: PreviewProvider {
    static var previews: some View {
        SquareButton(title: "Test")
    }
}
