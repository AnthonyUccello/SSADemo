//
//  S_App.swift
//  SingleStateArchitectureDemo
//
//  Created by Anthony Uccello on 2018-01-08.
//  Copyright © 2018 Anthony Uccello. All rights reserved.
//

import Foundation
import UIKit

class S_App
{
    var currentController:UIViewController!
    
    var navigationStack:[UIViewController] = []
    
    var selectProduct:S_SelectProduct!
    var checkout:S_Checkout!
    var selectedShoes:[S_Shoe] = []
    
    func getTotalPrice() -> Float
    {
        var price:Float = 0
        for shoe in selectedShoes
        {
            price += shoe.model.price
        }
        
        return price
    }
}
