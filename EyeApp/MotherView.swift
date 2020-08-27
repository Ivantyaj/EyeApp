//
//  MotherView.swift
//  EyeApp
//
//  Created by Macintosh on 6/27/20.
//  Copyright © 2020 IVDEV. All rights reserved.
//

import SwiftUI

struct MotherView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var fetchData: FetchingData
    
    var body: some View {
        VStack{
            if viewRouter.currentPage == "onboardingView" {
                OnboardingView()
            } else if viewRouter.currentPage == "homeView" {
                HomeView()
            }
            
            if !fetchData.isFetchData {
                LoadingView()
            }
        }
        .preferredColorScheme(.dark)
        .onAppear(){
            self.fetchData.fetchExercisesButtonData()
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView().environmentObject(ViewRouter())
        .environmentObject(FetchingData())
    }
}
