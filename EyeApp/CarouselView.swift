//
//  Carousel.swift
//  EyeApp
//
//  Created by Macintosh on 7/21/20.
//  Copyright © 2020 IVDEV. All rights reserved.
//

import SwiftUI

struct CarouselView : View {
    
    var title : String = ""
    
    @State var x : CGFloat = 0
    @State var count : CGFloat = 0
    @State var screen = UIScreen.main.bounds.width - 30
    @State var op : CGFloat = 0
    @State private var isShow = false
    
    @State var data = [
        
        TaskCard(id: 0, img: "EXG3", name: "Води глазами туда-сюда\nКрайнe полезное упражнение и вот это вот все", show: false),
        TaskCard(id: 1, img: "EXG4", name: "По углам резко", show: false),
        TaskCard(id: 2, img: "EXG5", name: "Восьмёрочкой", show: false)
        
    ]
    
    var body : some View{
        
        //        NavigationView{
        
        VStack{
            
            Spacer()
            if isShow {
                HStack(spacing: 15){
                    
                    ForEach(data){i in
                        
                        CardView(data: i)
                            .offset(x: self.x)
                            .highPriorityGesture(DragGesture()
                                
                                .onChanged({ (value) in
                                    
                                    if value.translation.width > 0{
                                        
                                        self.x = value.location.x
                                    }
                                    else{
                                        
                                        self.x = value.location.x - self.screen
                                    }
                                    
                                })
                                .onEnded({ (value) in
                                    
                                    if value.translation.width > 0{
                                        
                                        
                                        if value.translation.width > ((self.screen - 80) / 2) && Int(self.count) != 0{
                                            
                                            
                                            self.count -= 1
                                            self.updateHeight(value: Int(self.count))
                                            self.x = -((self.screen + 15) * self.count)
                                        }
                                        else{
                                            
                                            self.x = -((self.screen + 15) * self.count)
                                        }
                                    }
                                    else{
                                        
                                        
                                        if -value.translation.width > ((self.screen - 80) / 2) && Int(self.count) !=  (self.data.count - 1){
                                            
                                            self.count += 1
                                            self.updateHeight(value: Int(self.count))
                                            self.x = -((self.screen + 15) * self.count)
                                        }
                                        else{
                                            
                                            self.x = -((self.screen + 15) * self.count)
                                        }
                                    }
                                })
                        )
                    }
                }
                .frame(width: UIScreen.main.bounds.width)
                .offset(x: self.op)
            }
            Spacer()
            
            AdBannerView()
        }
        .navigationBarTitle(title)
        .background(Color.black.opacity(0.07).edgesIgnoringSafeArea(.bottom))
        .animation(.spring())
        .onAppear {
            self.op = ((self.screen + 15) * CGFloat(self.data.count / 2)) - (self.data.count % 2 == 0 ? ((self.screen + 15) / 2) : 0)
            
            self.data[0].show = true
            self.isShow = true
        }
        
        //        }
    }
    
    func updateHeight(value : Int){
        
        
        for i in 0..<data.count{
            
            data[i].show = false
        }
        
        data[value].show = true
    }
}

struct Carousel_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView(title: "Test")
    }
}

struct CardView : View {
    
    var data : TaskCard
    
    var body : some View{
        
        VStack(alignment: .leading, spacing: 0){
            Spacer()
            Image(data.img)
                .resizable()
                .aspectRatio(contentMode: .fit)
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

struct TaskCard : Identifiable {
    
    var id : Int
    var img : String
    var name : String
    var show : Bool
}
