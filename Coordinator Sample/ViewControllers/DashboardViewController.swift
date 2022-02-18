//
//  DashboardViewController.swift
//  Coordinator Sample
//
//  Created by Sagaya Navis Vijay on 18/02/22.
//

import Foundation
import UIKit

public protocol DashboardViewControllerDelegate: AnyObject {
    func navigateToNextPage()
    func navigateToPreviousPage()
}

class DashboardViewController: UIViewController {
    
    weak var delegate: DashboardViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Dashboard"
    }
    
    @IBAction func goToDashboard(_ sender: Any) {
        self.delegate?.navigateToNextPage()
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.delegate?.navigateToPreviousPage()
    }
    
}
