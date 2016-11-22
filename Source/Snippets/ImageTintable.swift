//
//  ImageTintable.swift
//  Snippets
//
//  Created by Calebe Emerick on 20/11/16.
//  Copyright © 2016 CodeLLamas. All rights reserved.
//

import UIKit

public protocol ImageTintable {
    
    func tint(color: UIColor)
}

public extension ImageTintable where Self : UIImageView {
    
    public func tint(color: UIColor) {
        
        let image = self.image
        self.image = image?.withRenderingMode(.alwaysTemplate)
        self.tintColor = color
    }
    
    public func tint(with image: UIImage?, color: UIColor) {
        
        self.image = image?.withRenderingMode(.alwaysTemplate)
        self.tintColor = color
    }
}

extension UIImageView : ImageTintable { }
