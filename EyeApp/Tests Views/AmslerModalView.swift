//
//  AmslerModalView.swift
//  EyeApp
//
//  Created by Macintosh on 6/30/20.
//  Copyright © 2020 IVDEV. All rights reserved.
//

import SwiftUI

struct AmslerModalView: View{
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ScrollView {
            VStack {
                Text("О тесте АМСЛЕРА")
                    .font(.largeTitle)
                    .padding(.bottom)
                Text("Наиболее простой и быстрый способ проверки центрального поля зрения (время на его проведение – 10-15 секунд). Выполняйте его регулярно (даже ежедневно) для оценки зрения и возможного появления первых симптомов возрастной макулярной дегенерации.")
                    .multilineTextAlignment(.leading)
                    .padding()
                
                Text("Результаты")
                    .font(.title)
                    .padding()
                
                Text("1. Если Вы наблюдаете четкие линии квадрата, тогда центральная часть сетчатки Вашего глаза в полном порядке.\n2. Если Вы при рассматривании линий квадрата наблюдаете какие-либо неровности, искажения, серые пятна, расплывчатость, например, как на рисунке ниже, тогда Вам необходимо обратиться к офтальмологу. Подобные отклонения могут свидетельствовать о патологических изменениях в центральной части сетчатки глаза.")
                    .padding()
                
                Image("AmslerGridResult")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal)
                
                Spacer()

                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Скрыть подробности")
                }
            }
        }
    }
}

struct AmslerModalView_Previews: PreviewProvider {
    static var previews: some View {
        AmslerModalView()
    }
}
