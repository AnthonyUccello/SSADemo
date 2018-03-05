//
//  MM_ShoeSizeToImage.swift
//  SingleStateArchitectureDemo
//
//  Created by Anthony Uccello on 2018-01-04.
//  Copyright © 2018 Anthony Uccello. All rights reserved.
//

import Foundation
import UIKit

class MM_ShoeSizeToImage
{
    static private var map:[T_ShoeSizes:UIImage] =
    [
        T_ShoeSizes.EIGHT : UIImage(named:"8")!,
        T_ShoeSizes.NINE : UIImage(named:"9")!,
        T_ShoeSizes.TEN : UIImage(named:"10")!,
    ]
    
    static func Get(type:T_ShoeSizes) -> UIImage
    {
        if (map[type] == nil)
        {
            print("Missing: \(type)")
        }
        
        return map[type]!
    }
    
    static func GetAll() -> [UIImage]
    {
        return map.map { $1 }
    }
}
