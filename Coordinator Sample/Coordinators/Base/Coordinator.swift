//
//  Coordinator.swift
//  Coordinator Sample
//
//  Created by Sagaya Navis Vijay on 18/02/22.
//

import UIKit

protocol Coordinator {
    
    var childCoordinators: [Coordinator] { get set }
    init(navigationController:UINavigationController)

    func start()
    
}


protocol BackToPreviousViewControllerDelegate: AnyObject {
    func navigateBackToRoot(_ newOrderCoordinator: Coordinator)
    func navigateBack(_ newOrderCoordinator: Coordinator)
}

extension BackToPreviousViewControllerDelegate {
    func navigateBack(_ newOrderCoordinator: Coordinator){ }
}


