//
//  UIStoryboard+Storyboard.swift
//  NotMyDoge
//
//  Created by Aaqib Hussain on 31/8/18.
//  Copyright © 2018 Aaqib Hussain. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    enum Storyboard: String {
        case main
        
        var filename: String {
            return rawValue.capitalized
        }
    }
    
    class func storyboard(storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard.filename, bundle: bundle)
    }
}
