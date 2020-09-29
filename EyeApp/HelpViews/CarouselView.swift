//
//  Carousel.swift
//  EyeApp
//
//  Created by Macintosh on 7/21/20.
//  Copyright © 2020 IVDEV. All rights reserved.
//

import SwiftUI
import GoogleMobileAds
import FirebaseFirestoreSwift
import Firebase
import FirebaseFirestore
import URLImage

struct CarouselView : View {
    
    @State var navBarTitle : String = ""
    @State var dataCard : [TaskCard] = []
    
    @State private var isShow = false
    
    @State private var interstital : GADInterstitial!
    
    @State private var cardStep = 0
    
    var body : some View{
        VStack{
            
            Spacer()
            if isShow {
                VStack {
                    TabView(selection: $cardStep){
                        ForEach(0..<dataCard.count){index in
                            CardView(data: dataCard[index]).tag(index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    
                    Button(action: {
                        if(cardStep < dataCard.count - 1){
                            cardStep += 1
                        } else {
                            cardStep = 0
                        }
                    }) {
                        HStack {
//                            if (cardStep < dataCard.count){
//                                Text("Далее")
//                            }
                            cardStep < dataCard.count - 1 ? Text("Далее") : Text("Повторить")
                            Image(systemName: "chevron.right")
                        }
                        .padding(.horizontal)
                        .padding()
                        .background(Capsule().fill(Color("ButtonColor")))
                        .accentColor((Color("Light")))
                    }
                }
                
            }
            Spacer()
            
            AdBannerView()
        }
        .navigationBarTitle(navBarTitle)
        .background(Color.black.opacity(0.07).edgesIgnoringSafeArea(.bottom))
        .animation(.spring())
        .onAppear {

            
            self.isShow = true
            
            //Init interstital ads
            self.interstital = GADInterstitial(adUnitID: "ca-app-pub-7080651716382146/2705283372")
            let req = GADRequest()
            self.interstital.load(req)
            
        }
        .onDisappear {
            //            IT's about advertising // uncomment if u whant money
            //                        if self.interstital.isReady{
            //                            let root = UIApplication.shared.windows.first?.rootViewController
            //                            self.interstital.present(fromRootViewController: root!)
            //                        }
        }
    }
}

struct Carousel_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView(navBarTitle: "Test", dataCard: [
            TaskCard(img: "https://im0-tub-by.yandex.net/i?id=199a56cddd1fea973c6fa1679332348e&n=13", name: "sdfaf", show: true),
            TaskCard(img: "https://im0-tub-by.yandex.net/i?id=199a56cddd1fea973c6fa1679332348e&n=13", name: "wqerqr", show: true)])
    }
}

struct CardView : View {
    
    var data : TaskCard
    
    var body : some View{
        
        VStack(alignment: .leading, spacing: 0){
            Spacer()
            URLImage(URL(string: data.img)!,
                     placeholder: {
                        ProgressView($0) { progress in
                            ZStack {
                                if progress > 0.0 {
                                    CircleProgressView(progress).stroke(lineWidth: 8.0)
                                }
                                else {
                                    CircleActivityView().stroke(lineWidth: 50.0)
                                }
                            }
                        }
                        .frame(width: 50.0, height: 50.0)
            },
                     content: {
                        $0.image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        //                            .clipShape(RoundedRectangle(cornerRadius: 5))
                        //                            .padding(.all, 40.0)
                        //                            .shadow(radius: 10.0)
            })
            //            Image(data.img)
            //                .resizable()
            //                .aspectRatio(contentMode: .fit)
            Spacer()
            
            Text(data.name)
                .fontWeight(.bold)
                .padding(.vertical, 13)
                .padding(.leading)
                .frame(height: 100)
                .foregroundColor(.black)
        }
        .frame(width: UIScreen.main.bounds.width - 30, height: data.show ? 500 : 440)
        .background(Color.white)
        .cornerRadius(25)
    }
}

struct TaskCard : Identifiable, Codable {
    
    @DocumentID var id : String? = UUID().uuidString
    var img : String
    var name : String
    var show : Bool
}

