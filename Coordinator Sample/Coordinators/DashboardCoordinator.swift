//
//  DashboardCoordinator.swift
//  Coordinator Sample
//
//  Created by Sagaya Navis Vijay on 18/02/22.
//

import Foundation
import UIKit

//MARK: - Login Coordinator
class DashboardCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    unowned let navigationController:UINavigationController
    
    weak var delegate: BackToPreviousViewControllerDelegate?

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
        viewController.delegate = self
        navigationController.pushViewController(viewController, animated: false)
    }
    
}


//MARK: - Conforming to Login View Controller Protocol
extension DashboardCoordinator : DashboardViewControllerDelegate {
    
    func navigateToNextPage() {
        let coordinator = ProfileCoordinator(navigationController: navigationController)
        coordinator.delegate = self
        childCoordinators.append(coordinator)
        coordinator.start()
    }
    
    func navigateToPreviousPage() {
        self.delegate?.navigateBackToRoot(self)
    }
    
}


//MARK: - Conforming to Back To Previous ViewController Delegate
extension DashboardCoordinator: BackToPreviousViewControllerDelegate {
    
    func navigateBackToRoot(_ newOrderCoordinator: Coordinator) {
        navigationController.popToRootViewController(animated: true)
        childCoordinators.removeAll()
    }
    
    func navigateBack(_ newOrderCoordinator: Coordinator) {
        navigationController.viewControllers.removeLast()
        childCoordinators.removeLast()
    }
    
}
