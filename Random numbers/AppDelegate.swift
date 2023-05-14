//
//  AppDelegate.swift
//  Random numbers
//
//  Created by SARVADHI on 02/05/23.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window?.frame = UIScreen.main.bounds
        self.gotoMainScreen()
        IQKeyboardManager.shared.enable = true
        // Override point for customization after application launch.
        return true
    }
    
    func gotoMainScreen() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let nav = UINavigationController(rootViewController: vc)
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
    }

    // MARK: UISceneSession Lifecycle


}

