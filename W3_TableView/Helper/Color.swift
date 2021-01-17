//
//  Color.swift
//  W3_TableView
//
//  Created by Beomcheol Kwon on 2021/01/13.
//

import UIKit

func createRandomColorData(items: Int) -> [UIColor] {
    
    return (0..<items).map { _ in
        UIColor.createRandomColor()
    }
    
}

extension UIColor {
    
    class func createRandomColor() -> UIColor {
        let red = CGFloat(arc4random() % 255 ) / 255
        let green = CGFloat(arc4random() % 255 ) / 255
        let blue = CGFloat(arc4random() % 255 ) / 255
        
        return UIColor(displayP3Red: red, green: green, blue: blue, alpha: 1.0)
    }
}
