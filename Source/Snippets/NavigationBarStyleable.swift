//
//  NavigationBarStyleable.swift
//  Snippets
//
//  Created by Calebe Emerick on 22/11/16.
//  Copyright © 2016 CodeLLamas. All rights reserved.
//

import UIKit

public protocol NavigationBarStyleable {

    func tintNavigationBar(with color: UIColor)
    func removeNavigationBarShadow()
    func clearNavigationBarBackground()
    func changeNavigationBarBackButton(to image: UIImage?, with color: UIColor, title: String)
}

public extension NavigationBarStyleable where Self : UIViewController {
    
    public func tintNavigationBar(with color: UIColor) {
        
        navigationController?.navigationBar.barTintColor = color
    }
    
    public func removeNavigationBarShadow() {
        
        let emptyImage = UIImage()
        
        navigationController?.navigationBar.setBackgroundImage(emptyImage, for: .default)
        navigationController?.navigationBar.shadowImage = emptyImage
    }
    
    public func clearNavigationBarBackground() {
        
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
    }
    
    public func changeNavigationBarBackButton(to image: UIImage?, with color: UIColor = .white, title: String = "") {

        navigationController?.navigationBar.tintColor = color
        navigationController?.navigationBar.backIndicatorImage = image
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = image
        navigationItem.backBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
    }
}
