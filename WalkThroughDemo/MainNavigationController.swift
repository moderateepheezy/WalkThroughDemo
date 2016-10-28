//
//  MainNavigationController.swift
//  WalkThroughDemo
//
//  Created by SimpuMind on 10/27/16.
//  Copyright © 2016 SimpuMind. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        if isLoggedIn() {
            //assume user is logged in
            let homeController = HomeController()
            viewControllers = [homeController]
            
        }else{
            perform(#selector(showLoginController), with: nil,afterDelay: 0.01)
        }
    }
    
    fileprivate func isLoggedIn() -> Bool {
        return UserDefaults.standard.isLoggedIn()
    }
    
    func showLoginController(){
        let loginController = LoginController()
        present(loginController, animated: true, completion: {
            //perphaps whe do something here later
        })
    }
}


