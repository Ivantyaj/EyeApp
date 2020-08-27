//
//  LoadingView.swift
//  EyeApp
//
//  Created by Macintosh on 8/26/20.
//  Copyright © 2020 IVDEV. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack{
            BlurView()
            
            VStack{
                
                Indicator()
                Text("Падажжи пока")
                    .foregroundColor(.white)
                    .padding(.top, 8)
            }
        }
    .frame(width: 250, height: 250)
    .cornerRadius(25)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}


struct BlurView : UIViewRepresentable{
    func  makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIVisualEffectView {
        
        let effect = UIBlurEffect(style: .systemMaterialDark)
        let view = UIVisualEffectView(effect: effect)
        return view
    }
    func  updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<BlurView>) {
        
    }
}

struct Indicator : UIViewRepresentable{
    func  makeUIView(context: UIViewRepresentableContext<Indicator>) -> UIActivityIndicatorView {
        
        let indi = UIActivityIndicatorView(style: .large)
        indi.color = UIColor.white
        indi.startAnimating()
        return indi
    }
    func  updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Indicator>) {
        
    }
}


