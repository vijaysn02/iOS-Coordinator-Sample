//
//  ProfileCoordinator.swift
//  Coordinator Sample
//
//  Created by Sagaya Navis Vijay on 18/02/22.
//

import Foundation
import UIKit

//MARK: - Profile Coordinator
class ProfileCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    unowned let navigationController:UINavigationController
    
    weak var delegate: BackToPreviousViewControllerDelegate?

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        viewController.delegate = self
        navigationController.pushViewController(viewController, animated: false)
    }
    
}

//MARK: - Conforming to Login View Controller Protocol
extension ProfileCoordinator : ProfileViewControllerDelegate {
    
    func navigateToRootPage() {
        self.delegate?.navigateBackToRoot(self)
    }
    
    func navigateBack() {
        self.delegate?.navigateBack(self)
    }
    
}
