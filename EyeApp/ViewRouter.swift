//
//  ViewRouter.swift
//  EyeApp
//
//  Created by Macintosh on 6/27/20.
//  Copyright © 2020 IVDEV. All rights reserved.
//

import Foundation
import SwiftUI

class ViewRouter: ObservableObject {
    
    @Published var currentPage: String
    
    init() {
        if !UserDefaults.standard.bool(forKey: "didLaunchBefore") {
            UserDefaults.standard.set(true, forKey: "didLaunchBefore")
            currentPage = "onboardingView"
        } else {
            currentPage = "homeView"
        }
        
    }
}
