//
//  M_Shoe.swift
//  SingleStateArchitectureDemo
//
//  Created by Anthony Uccello on 2018-01-03.
//  Copyright © 2018 Anthony Uccello. All rights reserved.
//

import Foundation
import UIKit

struct M_Shoe
{
    init()
    {
        _type = T_Shoes.ONE
        _price = 63.33
        _name = "Shoe 2"
        _image = UIImage(named:"shoe2")!
        _colors = [UIColor.black, UIColor.green, UIColor.red]
        _sizes = [T_ShoeSizes.EIGHT, T_ShoeSizes.TEN]
        initialize()
    }
    
    func initialize()
    {
        
    }
    
    var price:Float { get {return _price} }
    var type:T_Shoes { get {return _type} }
    var name: String { get {return _name} }
    var image:UIImage { get {return _image} }
    var colors:[UIColor] { get {return _colors} }
    var sizes:[T_ShoeSizes] { get {return _sizes} }
    
    var _price:Float
    var _type:T_Shoes
    var _name: String
    var _image:UIImage
    var _colors:[UIColor]
    var _sizes:[T_ShoeSizes]
    
    enum CodingKeys : String, CodingKey
    {
        case _price
        case _type
        case _name
        case _image
        case _colors
        case _sizes
    }
}
