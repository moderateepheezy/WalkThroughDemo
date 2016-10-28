//
//  UserDefaults.swift
//  WalkThroughDemo
//
//  Created by SimpuMind on 10/28/16.
//  Copyright © 2016 SimpuMind. All rights reserved.
//

import UIKit

extension UserDefaults{
    
    enum UserDefaultsKey: String {
        case isLoggedIn
    }
    
    func setIsLoggedIn(value: Bool) {
        set(value, forKey: UserDefaultsKey.isLoggedIn.rawValue)
        synchronize()
    }
    
    func isLoggedIn() -> Bool{
        return bool(forKey: UserDefaultsKey.isLoggedIn.rawValue)
    }
}
