//
//  MM_ShoeSizeToString.swift
//  SingleStateArchitectureDemo
//
//  Created by Anthony Uccello on 2018-01-08.
//  Copyright © 2018 Anthony Uccello. All rights reserved.
//

import Foundation

class MM_ShoeSizeToString
{
    static private var map:[T_ShoeSizes:String] =
        [
            T_ShoeSizes.EIGHT : "8",
            T_ShoeSizes.NINE : "9",
            T_ShoeSizes.TEN : "10",
            ]
    
    static func Get(type:T_ShoeSizes) -> String
    {
        if (map[type] == nil)
        {
            print("Missing: \(type)")
        }
        
        return map[type]!
    }
    
    static func GetAll() -> [String]
    {
        return map.map { $1 }
    }
}
