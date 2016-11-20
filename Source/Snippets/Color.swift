//
//  Color.swift
//  Snippets
//
//  Created by Calebe Emerick on 20/11/16.
//  Copyright © 2016 CodeLLamas. All rights reserved.
//

import UIKit

public struct Color {
    
    fileprivate let hexString: String
    fileprivate let alpha: Float
    
    public init(hexString: String, alpha: Float = 1) {
        
        self.hexString = hexString
        self.alpha = alpha
    }
}

public extension Color {
    
    var color: UIColor {
        
        return makeColor()
    }
    
    var cgColor: CGColor {
        
        return makeColor().cgColor
    }
    
    var strColor: String {
        
        return hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
    }
}

fileprivate extension Color {

    fileprivate func makeColor() -> UIColor {
        
        let hex = convertToRGB()
        
        return UIColor(colorLiteralRed: hex.r / 255, green: hex.g / 255, blue: hex.b / 255, alpha: alpha)
    }
    
    private func convertToRGB() -> (r: Float, g: Float, b: Float) {
        
        var int = UInt32()
        let hex = strColor
        
        Scanner(string: hex).scanHexInt32(&int)
        
        let r, g, b: UInt32
        
        switch hex.characters.count {
            
        case 3: (r, g, b) = ((int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: (r, g, b) = (int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: (r, g, b) = (int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default: (r, g, b) = (0, 0, 0)
            print("Color not found.")
        }
        
        return (r: Float(r), g: Float(g), b: Float(b))
    }
}
