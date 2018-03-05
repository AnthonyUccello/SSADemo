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
    init(type:T_Shoes, price:Float, name:String, imageName:String, colors:[UIColor], sizes:[T_ShoeSizes])
    {
        _type = type
        _price = price
        _name = name
        _image = UIImage(named:imageName)!
        _colors = colors
        _sizes = sizes
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
    
//    enum CodingKeys : String, CodingKey
//    {
//        case _price
//        case _type
//        case _name
//        case _image
//        case _colors
//        case _sizes
//    }
}
