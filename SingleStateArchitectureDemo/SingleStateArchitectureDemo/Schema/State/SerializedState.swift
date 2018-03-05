//
//  SerializedState.swift
//  SingleStateArchitectureDemo
//
//  Created by Anthony Uccello on 2018-01-08.
//  Copyright © 2018 Anthony Uccello. All rights reserved.
//

import Foundation
import UIKit

struct SerializedState : Codable
{
    var savedProductSelection:S_Shoe!
    
    init()
    {
        // Default Values
        savedProductSelection = S_Shoe()
        savedProductSelection.color = UIColor.red
        savedProductSelection.size = T_ShoeSizes.NINE
        savedProductSelection.selectionIndex = 0
    }
    
    enum CodingKeys: String, CodingKey
    {
        case selectedProduct
    }
    
    init(from decoder: Decoder) throws
    {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        savedProductSelection = try values.decode(S_Shoe.self, forKey: .selectedProduct)
        
        print("decoded \(savedProductSelection)")
    }
    
    func encode(to encoder: Encoder) throws
    {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(savedProductSelection, forKey: .selectedProduct)
    }
}
