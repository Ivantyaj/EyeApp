//
//  HomeView.swift
//  EyeApp
//
//  Created by Macintosh on 6/27/20.
//  Copyright © 2020 IVDEV. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            Text("Следующий экран")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
