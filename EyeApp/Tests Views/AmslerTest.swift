//
//  AmslerTest.swift
//  EyeApp
//
//  Created by Macintosh on 6/30/20.
//  Copyright © 2020 IVDEV. All rights reserved.
//

import SwiftUI

struct AmslerTest: View {
    @State private var showModal = false
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            GeometryReader{ geometry in
                VStack {
                    Spacer()
                    Text("Тест Амслера")
                        .font(.largeTitle)
                    Image("AmslerGrid")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal)
                    Text("""
    1. Наденьте очки или контактные линзы (если вы их обычно носите).
    2. Расположите сетку перед собой на расстоянии 20-30 см.
    3. Прикройте 1 глаз.
    4. Сосредоточив взгляд на центральной точке, оцените остальную часть сетки.
        - Все ли линии сетки прямые и ровные?
        - Все ли квадраты решетки одинакового размера?
        - Нет ли зон, где рисунок искажается, затуманивается, обесцвечивается?
    """)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal)
                        
                    
                    //                    .frame(width: geometry.size.width)
                    Spacer()
                    Button(action: {
                        self.showModal = true
                    }) {
                        Text("Подробности теста")
                    }.sheet(isPresented: self.$showModal) {
                        AmslerModalView()
                    }
                }
            }
        }
    }
}

struct AmslerTest_Previews: PreviewProvider {
    static var previews: some View {
        AmslerTest()
    }
}
