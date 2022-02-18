//
//  DashboardViewController.swift
//  Coordinator Sample
//
//  Created by Sagaya Navis Vijay on 18/02/22.
//

import Foundation
import UIKit

public protocol ProfileViewControllerDelegate: AnyObject {
    func navigateToRootPage()
    func navigateBack()
}

class ProfileViewController: UIViewController {
    
    weak var delegate: ProfileViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.delegate?.navigateBack()
    }
    @IBAction func logout(_ sender: Any) {
        self.delegate?.navigateToRootPage()
    }
    
    
    
}
