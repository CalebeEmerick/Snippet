//
//  ViewControllerReusable.swift
//  Snippets
//
//  Created by Calebe Emerick on 20/11/16.
//  Copyright © 2016 CodeLLamas. All rights reserved.
//

import UIKit

public protocol ViewControllerReusable {
    
    static var identifier: String { get }
    var contentViewController: UIViewController { get }
}

public extension ViewControllerReusable where Self : UIViewController {
    
    public static var identifier: String {
        
        return String(describing: self)
    }
    
    public var contentViewController: UIViewController {
        
        guard let nc = self as? UINavigationController else { return self }
        guard let vc = nc.visibleViewController else { return self }
        
        return vc
    }
}

extension UIViewController : ViewControllerReusable { }
