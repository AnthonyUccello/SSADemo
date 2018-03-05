//
//  C_SelectProduct.swift
//  SingleStateArchitectureDemo
//
//  Created by Anthony Uccello on 2018-01-03.
//  Copyright © 2018 Anthony Uccello. All rights reserved.
//

import Foundation
import UIKit

class C_SelectProduct : UIViewController
{
    private var _view:V_SelectProduct!
    
    override func loadView()
    {
        _view = V_SelectProduct(state: State.App.selectProduct)
        view = _view
         _view.backgroundColor = UIColor.orange
        
       // assignCallbacks()
       // _view.UpdateView()
    }
    
    func assignCallbacks()
    {
        _view.leftClickCallback = leftClick
        _view.rightClickCallback = rightClick
        _view.checkoutClickCallback = checkoutClick
        _view.addToCartClickCallback = addToCartClick
        _view.colorClickCallback = colorClick
        _view.sizeClickCallback = sizeClick
    }
    
    func colorClick(color:UIColor)
    {
        State.App.selectProduct.selectedColor = color
        _view.UpdateView()
        State.SaveState()
    }
    
    func sizeClick(size:T_ShoeSizes)
    {
        State.App.selectProduct.selectedShoeSize = size
        _view.UpdateView()
        State.SaveState()
    }
    
    func leftClick()
    {
        State.App.selectProduct.decrementSelectionIndex()
        _view.UpdateView()
        State.SaveState()
    }
    
    func rightClick()
    {
        State.App.selectProduct.incrementSelectionIndex()
        _view.UpdateView()
        State.SaveState()
    }
    
    func addToCartClick()
    {
        State.App.selectedShoes.append(State.App.selectProduct.createShoeFromSelection())
        
        print("Count is \(State.App.selectedShoes.count)")
    }
    
    func checkoutClick()
    {
        X_Navigator.Navigate(controller: C_Checkout())
    }
}
