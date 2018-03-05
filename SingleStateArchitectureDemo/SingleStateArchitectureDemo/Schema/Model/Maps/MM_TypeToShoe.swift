//
//  MM_TypeToShoe.swift
//  SingleStateArchitectureDemo
//
//  Created by Anthony Uccello on 2018-01-03.
//  Copyright © 2018 Anthony Uccello. All rights reserved.
//

import Foundation

class MM_TypeToShoe
{
    static private var map:[T_Shoes:M_Shoe] =
    [
        :
    ]
    
    static func Get(type:T_Shoes) -> M_Shoe
    {
        if (map == nil)
        {
            //init
        }
        
        if (map[type] == nil)
        {
            print("Missing: \(type)")
        }
        
        return map[type]!
    }
    
    static func GetAll() -> [M_Shoe]
    {
        return map.map { $1 }
    }
}
