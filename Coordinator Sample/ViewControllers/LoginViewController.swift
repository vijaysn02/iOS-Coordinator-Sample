//
//  ViewController.swift
//  Coordinator Sample
//
//  Created by Sagaya Navis Vijay on 17/02/22.
//

import UIKit
 
protocol MainViewControllerDelegate: AnyObject {
    func navigateToNextPage()
}

class LoginViewController: UIViewController {

    public weak var delegate: MainViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login - Root View"
    }

    @IBAction func goToLogin(_ sender: Any) {
        self.delegate?.navigateToNextPage()
    }

}




