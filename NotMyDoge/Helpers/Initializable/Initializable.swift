//
//  Initializable.swift
//  NotMyDoge
//
//  Created by Aaqib Hussain on 31/8/18.
//  Copyright © 2018 Aaqib Hussain. All rights reserved.
//

import UIKit
/**
 The sole purpose of this protocol is to be used for ViewControllers transitions
 instead of using segues
 **/

protocol Initializable {
    static var storyboardIdentifier: String { get }
    static var storyboardName: UIStoryboard.Storyboard { get }
    static func instantiateViewController() -> Self
}

extension UIViewController: Initializable {}

extension Initializable where Self: UIViewController {
    
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
    static var storyboardName: UIStoryboard.Storyboard {
        return UIStoryboard.Storyboard.main
    }
    
    static func instantiateViewController() -> Self {
        let storyboard = UIStoryboard.storyboard(storyboard: storyboardName)
        return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
        
    }
}


