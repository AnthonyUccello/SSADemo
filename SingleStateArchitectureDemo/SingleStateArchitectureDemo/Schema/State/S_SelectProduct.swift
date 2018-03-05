//
//  S_SelectProduct.swift
//  SingleStateArchitectureDemo
//
//  Created by Anthony Uccello on 2018-01-03.
//  Copyright © 2018 Anthony Uccello. All rights reserved.
//

import Foundation
import UIKit

class S_SelectProduct
{
    private var _selectedShoeIndex:Int = 0
    public var selectedShoeIndex:Int
    {
        get {return _selectedShoeIndex}
    }
    
    public var _selectedColor:UIColor = UIColor.black
    public var selectedColor:UIColor!
    {
        get {return _selectedColor}
        set
            {
                _selectedColor = newValue;
                updateSavedSelection()
                State.SaveState()
            }
    }
    
    public var _selectedShoeSize:T_ShoeSizes = T_ShoeSizes.TEN
    public var selectedShoeSize:T_ShoeSizes
    {
        get {return _selectedShoeSize}
        set {
                _selectedShoeSize = newValue
                updateSavedSelection()
                State.SaveState()
            }
    }
    private var _availableShoeModels:[M_Shoe]
    
    public var savedSelection:S_Shoe?
    
    init(shoeModels:[M_Shoe])
    {
        _availableShoeModels = shoeModels
    }
    
    private func updateSavedSelection()
    {
        savedSelection  = createShoeFromSelection()
    }
    
    public func createShoeFromSelection() -> S_Shoe
    {
        let shoe = S_Shoe()
        shoe.model = selectedShoeModel
        shoe.size = _selectedShoeSize
        shoe.color = _selectedColor
        shoe.selectionIndex = _selectedShoeIndex
        return shoe
    }
    
    public func incrementSelectionIndex()
    {
        _selectedShoeIndex += 1;
        if (_selectedShoeIndex >= _availableShoeModels.count)
        {
            _selectedShoeIndex = 0
        }
        
        _selectedColor = selectedShoeModel.colors[0]
        _selectedShoeSize = selectedShoeModel.sizes[0]
        updateSavedSelection()
        
        State.SaveState()
    }
    
    public func decrementSelectionIndex()
    {
        _selectedShoeIndex -= 1;
        if (_selectedShoeIndex < 0)
        {
            _selectedShoeIndex = availableShoeModels.count - 1
        }

        _selectedColor = selectedShoeModel.colors[0]
        _selectedShoeSize = selectedShoeModel.sizes[0]
        updateSavedSelection()
        
        State.SaveState()
    }

    public var availableShoeModels:[M_Shoe]
    {
        get {return _availableShoeModels}
    }
    
    public var selectedShoeModel:M_Shoe
    {
        get {return availableShoeModels[selectedShoeIndex]}
    }
    
    public func setSelectionSettings(settings:S_Shoe)
    {
        _selectedColor = settings.color
        _selectedShoeSize = settings.size
        _selectedShoeIndex = settings.selectionIndex
    }
}
