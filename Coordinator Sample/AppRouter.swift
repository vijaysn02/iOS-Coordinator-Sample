//
//  AppRouter.swift
//  Coordinator Sample
//
//  Created by Sagaya Navis Vijay on 18/02/22.
//

import Foundation
import UIKit

//MARK: - App Router - Handles Routing for VCs
class AppRouter {
    
    static var rootCoordinator:Coordinator?
    
    class func setRootViewController(windowScene:UIWindowScene) -> UIWindow {
        let window = UIWindow(windowScene: windowScene)
        let initialViewController = setRootViewController()
        window.rootViewController = initialViewController
        return window
    }
    
    class func setRootViewController() -> UINavigationController {
        
        let navController = UINavigationController()
        rootCoordinator = LoginCoordinator(navigationController: navController)
        rootCoordinator?.start()
        return navController
        
    }
    
}
