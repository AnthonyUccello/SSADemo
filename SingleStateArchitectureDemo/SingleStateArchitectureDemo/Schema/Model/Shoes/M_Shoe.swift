//
//  M_Shoe.swift
//  SingleStateArchitectureDemo
//
//  Created by Anthony Uccello on 2018-01-03.
//  Copyright © 2018 Anthony Uccello. All rights reserved.
//

import Foundation
import UIKit

struct M_Shoe : Decodable
{
    public init(from decoder: Decoder) throws
    {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        _price = try values.decode(Float.self, forKey: ._price)
        _type = T_Shoes(rawValue: try values.decode(Int.self, forKey: ._type))!
        _name = try values.decode(String.self, forKey: ._name)
        _imageString = try values.decode(String.self, forKey: ._imageString)
        _image = UIImage(named:_imageString)!
        _colors = [UIColor.green, UIColor.red]
        _sizes = [T_ShoeSizes.EIGHT, T_ShoeSizes.NINE]
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
    var _colors:[UIColor]
    var _sizes:[T_ShoeSizes]
    var _imageString:String
    
    // Complex Step
    var _image:UIImage
    
    enum CodingKeys : String, CodingKey
    {
        case _price
        case _type
        case _name
        case _imageString
        case _colors
        case _sizes
    }
}
