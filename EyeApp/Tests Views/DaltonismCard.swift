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
    
    @State private var selected = ""
    @State private var okButton = false
    
    var body: some View {
        VStack {
            if self.okButton {
                Text(selected)
            }
            RadioButtons(data: ["1111","2222","3333"], selected: self.$selected, show: self.$okButton)
        }
    }
}

struct DaltonismCard_Previews: PreviewProvider {
    static var previews: some View {
        DaltonismCard()
    }
}
