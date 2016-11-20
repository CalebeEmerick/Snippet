//
//  ArrayHelper.swift
//  Snippets
//
//  Created by Calebe Emerick on 18/11/16.
//  Copyright © 2016 CodeLLamas. All rights reserved.
//

import Foundation

extension RangeReplaceableCollection where Iterator.Element : Equatable {
    
    mutating func remove(item: Self.Iterator.Element) {
        
        guard let index = self.index(of: item) else {
        
            fatalError("The item: \(item) is not inside the array.")
        }
        
        self.remove(at: index)
    }
    
    mutating func remove(items: [Self.Iterator.Element]) {
        
        for item in items {
            
            self.remove(item: item)
        }
    }
    
    mutating func replace(item: Self.Iterator.Element, at index: Self.Index) {
        
        self.remove(at: index)
        self.insert(item, at: index)
    }
}
