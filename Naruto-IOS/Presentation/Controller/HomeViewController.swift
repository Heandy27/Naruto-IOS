//
//  HomeViewController.swift
//  Naruto-IOS
//
//  Created by Andy Heredia on 15/9/24.
//

import UIKit

final class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    @IBAction func logginButtonPressed(_ sender: UIButton) {
      
        let narutoListViewController = NarutoListViewController()
        navigationController?.show(narutoListViewController, sender: self)
        
    }
    

}
