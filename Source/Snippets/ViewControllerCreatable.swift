//
//  ViewControllerCreatable.swift
//  Snippets
//
//  Created by Calebe Emerick on 20/11/16.
//  Copyright © 2016 CodeLLamas. All rights reserved.
//

import UIKit

public protocol ViewControllerCreatable { }

public extension ViewControllerCreatable where Self : UIViewController {
    
    public func createControllerFromNavigationWith<T: UIViewController>(_ identifier: String, kindOf type: T.Type, from storyboard: UIStoryboard) -> StackController<T>? {
        
        guard let nc = storyboard.instantiateViewController(withIdentifier: identifier) as?
            UINavigationController else { return nil }
        guard let vc = nc.contentViewController as? T else { return nil }
        
        return StackController(navigation: nc, controller: vc)
    }
}

