//
//  TableViewHeight.swift
//  Snippets
//
//  Created by Calebe Emerick on 20/11/16.
//  Copyright © 2016 CodeLLamas. All rights reserved.
//

import UIKit

public enum TableViewHeight {
    
    case automatic(CGFloat)
    case `static`(CGFloat)
}

public protocol TableViewStyleable { }

public extension TableViewStyleable where Self : UITableView {
    
    public func heightStyle(height: TableViewHeight) {
        
        switch height {
            
        case let .static(height):
            self.rowHeight = height
            
        case let .automatic(height):
            self.estimatedRowHeight = height
            self.rowHeight = UITableViewAutomaticDimension
        }
    }
}

extension UITableView : TableViewStyleable { }
