//
//  AdBannerView.swift
//  EyeApp
//
//  Created by Macintosh on 7/22/20.
//  Copyright © 2020 IVDEV. All rights reserved.
//

import SwiftUI
import GoogleMobileAds

struct AdBannerView: View {
    var body: some View {
        VStack {
            AdView()
                .frame(height: 50, alignment: .center)
                
        }
        .background(Color.white)
    }
}

struct AdBannerView_Previews: PreviewProvider {
    static var previews: some View {
        AdBannerView()
    }
}

struct AdView: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<AdView>) -> GADBannerView{
        let banner = GADBannerView(adSize: kGADAdSizeBanner)
        
        banner.adUnitID = "ca-app-pub-7080651716382146/9877002862"
        banner.rootViewController = UIApplication.shared.windows.first?.rootViewController
        banner.load(GADRequest())
        
        return banner
    }
    func updateUIView(_ uiView: GADBannerView, context: UIViewRepresentableContext<AdView>) {
        
    }
}
