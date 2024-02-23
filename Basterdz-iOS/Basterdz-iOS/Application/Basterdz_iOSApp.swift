//
//  Basterdz_iOSApp.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2024/02/01.
//

import SwiftUI

@main
struct Basterdz_iOSApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var appRootManager = AppRootManager()
    
    var body: some Scene {
        WindowGroup {
            Group {
                switch appRootManager.currentRoot {
                case .splash:
                    SplashView()
                case .main:
                    TabbarView()
                        .accentColor(Color(.mainBlack))
                }
            }
            .environmentObject(appRootManager)
        }
    }
}

final class AppRootManager: ObservableObject {
    
    @Published var currentRoot: AppRoot = .splash
    
    enum AppRoot {
        case splash
        case main
    }
}
