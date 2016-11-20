//
//  AlertController.swift
//  Snippets
//
//  Created by Calebe Emerick on 18/11/16.
//  Copyright © 2016 CodeLLamas. All rights reserved.
//

import UIKit

public enum AlertAction {
    
    public typealias completion = ((UIAlertAction) -> Void)?
    
    case `default`(title: String, handler: completion)
    case cancel(title: String, handler: completion)
    case destructive(title: String, handler: completion)
}

public extension AlertAction {
    
    public var action: UIAlertAction {
        
        switch self {
            
        case let .default(title, handler):
            return UIAlertAction(title: title, style: .default, handler: handler)
        case let .cancel(title, handler):
            return UIAlertAction(title: title, style: .cancel, handler: handler)
        case let .destructive(title, handler):
            return UIAlertAction(title: title, style: .destructive, handler: handler)
        }
    }
}

public protocol AlertController {
    
    static func actionSheet(title: String?, message: String?, actions: [AlertAction]) -> UIAlertController
    static func alert(title: String?, message: String?, actions: [AlertAction]) -> UIAlertController
}

public extension AlertController where Self : UIAlertController {
    
    public static func actionSheet(title: String? = nil, message: String? = nil, actions: [AlertAction]) -> UIAlertController {
        
        return createAlertController(title: title, message: message, actions: actions, style: .actionSheet)
    }
    
    public static func alert(title: String? = nil, message: String? = nil, actions: [AlertAction]) -> UIAlertController {
        
        return createAlertController(title: title, message: message, actions: actions, style: .alert)
    }
    
    private static func createAlertController(title: String? = nil, message: String? = nil, actions: [AlertAction], style: UIAlertControllerStyle) -> UIAlertController {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        
        actions.forEach { alert.addAction($0.action) }
        
        return alert
    }
}

extension UIAlertController : AlertController { }
