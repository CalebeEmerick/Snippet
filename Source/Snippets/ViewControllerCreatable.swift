//
//  ViewControllerCreatable.swift
//  Snippets
//
//  Created by Calebe Emerick on 20/11/16.
//  Copyright © 2016 CodeLLamas. All rights reserved.
//

import UIKit

public protocol ViewControllerCreatable {

    func createControllerFromNavigationWith<T: UIViewController>(_ identifier: String, kindOf type: T.Type, from storyboard: UIStoryboard) -> ControllerStack<T>?
}

public extension ViewControllerCreatable {
    
    public func createControllerFromNavigationWith<T: UIViewController>(_ identifier: String, kindOf type: T.Type, from storyboard: UIStoryboard) -> ControllerStack<T>? {
        
        guard let nc = storyboard.instantiateViewController(withIdentifier: identifier) as?
            UINavigationController else { return nil }
        guard let vc = nc.contentViewController as? T else { return nil }
        
        return ControllerStack(navigation: nc, controller: vc)
    }
}
