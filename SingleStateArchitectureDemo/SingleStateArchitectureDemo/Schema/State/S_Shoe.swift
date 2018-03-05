//
//  S_Shoe.swift
//  SingleStateArchitectureDemo
//
//  Created by Anthony Uccello on 2018-01-03.
//  Copyright © 2018 Anthony Uccello. All rights reserved.
//

import Foundation
import UIKit

class S_Shoe : Codable
{
    public var model:M_Shoe!
    public var color:UIColor!
    public var size:T_ShoeSizes!
    public var selectionIndex:Int!
    
    
    private var r:CGFloat!
    private var g:CGFloat!
    private var b:CGFloat!
    
    private var type:T_Shoes = T_Shoes.ONE
    
    init()
    {
        
    }
    
    enum CodingKeys: String, CodingKey
    {
        case model
        case color
        case size
        case r
        case g
        case b
        case type
        case selectionIndex
    }
    
    required init(from decoder: Decoder) throws
    {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decode(T_Shoes.self, forKey: .type)
        
        //model = MM_TypeToShoe.Get(type: type)
        
        r = try values.decode(CGFloat.self, forKey: .r)
        g = try values.decode(CGFloat.self, forKey: .g)
        b = try values.decode(CGFloat.self, forKey: .b)

        color = UIColor(red: r, green: g, blue: b, alpha: 1)
        size = try values.decode(T_ShoeSizes.self, forKey: .size)
        
        selectionIndex = try values.decode(Int.self, forKey: .selectionIndex)
    }
    
    func encode(to encoder: Encoder) throws
    {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(model.type, forKey: .type)
        
        try container.encode(color.redValue, forKey: .r)
        try container.encode(color.greenValue, forKey: .g)
        try container.encode(color.blueValue, forKey: .b)
        try container.encode(size, forKey: .size)
        try container.encode(selectionIndex, forKey: .selectionIndex)
    }
    
}
