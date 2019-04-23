//
//  AppDelegate.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 28/02/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navController: UINavigationController?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let userNavigationController = UINavigationController()
        userNavigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        userNavigationController.navigationBar.shadowImage = UIImage()
        userNavigationController.navigationBar.isTranslucent = true
        userNavigationController.navigationBar.titleTextAttributes = ([NSAttributedString.Key.font: UIFont(
            name: "ProximaNova-Semibold",
            size: 15)!])
        userNavigationController.toolbar.isHidden = true
        navController = userNavigationController
        self.navController!.pushViewController(LoginMainViewController(), animated: false)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
        setup()
        return true
    }
    
    func setup() {
        UINavigationBar.appearance().backIndicatorImage = UIImage()
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage()
        UIBarButtonItem.appearance().setTitleTextAttributes(
            ([NSAttributedString.Key.font: UIFont(name: "ProximaNova-Semibold", size: 15)!,
              NSAttributedString.Key.foregroundColor: UIColor.customBlue]), for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes(
            ([NSAttributedString.Key.font: UIFont(name: "ProximaNova-Semibold", size: 15)!,
              NSAttributedString.Key.foregroundColor: UIColor.customBlue]), for: .highlighted)
        UIBarButtonItem.appearance().setTitleTextAttributes(
            ([NSAttributedString.Key.font: UIFont(name: "ProximaNova-Semibold", size: 15)!,
              NSAttributedString.Key.foregroundColor: UIColor.customBlue]), for: .disabled)
    }

    func changeStoryToMain() {
        let mainNavigationController = UINavigationController()
        mainNavigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        mainNavigationController.navigationBar.shadowImage = UIImage()
        mainNavigationController.navigationBar.isTranslucent = true
        mainNavigationController.navigationBar.prefersLargeTitles = true
        mainNavigationController.navigationBar.largeTitleTextAttributes = ([NSAttributedString.Key.font: UIFont(
            name: "ProximaNova-Black",
            size: 35)!])
        mainNavigationController.navigationBar.titleTextAttributes = ([NSAttributedString.Key.font: UIFont(
            name: "ProximaNova-Extrabld",
            size: 15)!])
        mainNavigationController.toolbar.isHidden = true
        mainNavigationController.pushViewController(HabitMainViewController(), animated: false)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = mainNavigationController
        self.window?.makeKeyAndVisible()
    }
}
