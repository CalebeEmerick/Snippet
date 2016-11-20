//
//  StackController.swift
//  Snippets
//
//  Created by Calebe Emerick on 20/11/16.
//  Copyright © 2016 CodeLLamas. All rights reserved.
//

import UIKit

public struct StackController<T: UIViewController> {
    
    public let navigation: UINavigationController
    public let controller: T
}
