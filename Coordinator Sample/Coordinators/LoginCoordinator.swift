//
//  MainCoordinator.swift
//  Coordinator Sample
//
//  Created by Sagaya Navis Vijay on 18/02/22.
//

import Foundation

import UIKit

//MARK: - Main Coordinator
class LoginCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    unowned let navigationController:UINavigationController

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        viewController.delegate = self
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
}

//MARK: - Conforming Main View Controller Protocol
extension LoginCoordinator: MainViewControllerDelegate {

    func navigateToNextPage() {
       navigateToLoginPage()
    }
    
    func navigateToLoginPage() {
        let coordinator = DashboardCoordinator(navigationController: navigationController)
        coordinator.delegate = self
        childCoordinators.append(coordinator)
        coordinator.start()
    }
    
}

//MARK: - Conforming to Back To Previous ViewController Delegate
extension LoginCoordinator: BackToPreviousViewControllerDelegate {
    
    func navigateBackToRoot(_ newOrderCoordinator: Coordinator) {
        navigationController.popToRootViewController(animated: true)
        childCoordinators.removeAll()
    }
    
}
