//
//  AppDelegate.swift
//  EstudandoViper
//
//  Created by rayner on 24/06/21.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    let router = SprintRouter()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let window = application.windows.first ?? UIWindow(frame: UIScreen.main.bounds)
        let navigationController = NavigationBuilder.build(rootView: router.view)

        window.rootViewController = navigationController
        self.window = window
        self.window?.makeKeyAndVisible()
        
        return true
    }

}

