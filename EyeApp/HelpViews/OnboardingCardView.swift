//
//  OnboardingCardView.swift
//  EyeApp
//
//  Created by Macintosh on 9/29/20.
//  Copyright © 2020 IVDEV. All rights reserved.
//

import SwiftUI

struct OnboardingCardView: View {
    var image:String
    var text:String
    
    var body: some View {
        VStack (spacing: 35) {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(height: 500)
            Text(text)
                .padding()
                .fixedSize(horizontal: false, vertical: true)
        }
//        .padding(.bottom, 50.0)
    }
}

struct OnboardingCardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingCardView(image: "P1", text: "Твои глаза в твоих руках")
    }
}
