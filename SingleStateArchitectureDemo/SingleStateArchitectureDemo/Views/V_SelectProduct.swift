//
//  V_SelectProduct.swift
//  SingleStateArchitectureDemo
//
//  Created by Anthony Uccello on 2018-01-03.
//  Copyright © 2018 Anthony Uccello. All rights reserved.
//

import Foundation
import UIKit

class V_SelectProduct : UIView
{
    private var _state:S_SelectProduct
    
    private var _mainImage:UIImageView!
    private var _leftButton:UIButton!
    private var _rightButton:UIButton!
    private var _addToCartButton:UIButton!
    private var _checkoutButton:UIButton!
    private var _colorPicker:W_ColorPicker!
    private var _sizePicker:W_SizePicker!
    private var _crashButton:UIButton!
    
    public var leftClickCallback:(() -> ())?
    public var rightClickCallback:(() -> ())?
    public var checkoutClickCallback:(() -> ())?
    public var addToCartClickCallback:(() -> ())?
    public var colorClickCallback:((UIColor) -> ())?
    public var sizeClickCallback:((T_ShoeSizes) -> ())?
    
    init(state:S_SelectProduct)
    {
        _state = state
        
        super.init(frame:ViewUtils.GetScreenSizeRect())
        
       // loadView()
       // UpdateView()
    }
    
    private func loadView()
    {
        _mainImage = UIImageView(image: _state.selectedShoeModel.image)
        _mainImage.alignCenterXAndYToTargetCenter(self)
        _mainImage.sizeToFit()
        addSubview(_mainImage)
        
        _colorPicker = W_ColorPicker(colors: _state.selectedShoeModel.colors)
        _colorPicker.alignYToTargetTop(_mainImage, offset: -60)
        _colorPicker.alignCenterXToTargetCenter(self)
        _colorPicker.clickCallback = colorClick
        addSubview(_colorPicker)
        
        _sizePicker = W_SizePicker(_state.selectedShoeModel.sizes)
        _sizePicker.alignYToTargetBottom(_mainImage, offset: 20)
        _sizePicker.alignCenterXToTargetCenter(self)
        _sizePicker.clickCallback = sizeClick
        addSubview(_sizePicker)
        
        _leftButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        _leftButton.alignXToTargetRight(_mainImage, offset: -200)
        _leftButton.setImage(UIImage(named:"left"), for: .normal)
        _leftButton.alignCenterYToTargetCenter(_mainImage)
        _leftButton.addTarget(self, action: #selector(leftClick), for: .touchUpInside)
        addSubview(_leftButton)
        
        _rightButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        _rightButton.alignXToTargetRight(_mainImage, offset: 35)
        _rightButton.setImage(UIImage(named:"right"), for: .normal)
        _rightButton.alignCenterYToTargetCenter(_mainImage)
        _rightButton.addTarget(self, action: #selector(rightClick), for: .touchUpInside)
        addSubview(_rightButton)
        
        _checkoutButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        _checkoutButton.alignCenterXToTargetCenter(self)
        _checkoutButton.setTitle("Checkout", for: .normal)
        _checkoutButton.setY = ViewUtils.GetScreenHeight() - 60
        _checkoutButton.addTarget(self, action: #selector(checkoutClick), for: .touchUpInside)
        _checkoutButton.backgroundColor = UIColor.black
        addSubview(_checkoutButton)
        
        _addToCartButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        _addToCartButton.alignCenterXToTargetCenter(_checkoutButton)
        _addToCartButton.backgroundColor = UIColor.black
        _addToCartButton.setTitle("Add To Cart", for: .normal)
        _addToCartButton.setY = ViewUtils.GetScreenHeight() - 120
        _addToCartButton.addTarget(self, action: #selector(addToCartClick), for: .touchUpInside)
        addSubview(_addToCartButton)
        
        _crashButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        _crashButton.setTitle("Crash", for: .normal)
        _crashButton.setX = ViewUtils.GetScreenWidth() - 60
        _crashButton.setY = ViewUtils.GetScreenHeight() - 60
        _crashButton.backgroundColor = UIColor.red
        _crashButton.addTarget(self, action: #selector(crashClick), for: .touchUpInside)
        //addSubview(_crashButton)
    }
    
    @objc func crashClick()
    {
        fatalError()
    }
    
    
    public func UpdateView()
    {
        _mainImage.image = _state.selectedShoeModel.image
        
        _colorPicker.ChangeColors(_state.selectedShoeModel.colors)
        _colorPicker.alignCenterXToTargetCenter(self)
        if (_state.savedSelection != nil)
        {
            _colorPicker.SetColorSelected(color: _state.savedSelection!.color)
        } else
        {
            _colorPicker.SetFirstOptionSelected()
        }
        
        _sizePicker.ChangeSizes(_state.selectedShoeModel.sizes)
        _sizePicker.alignCenterXToTargetCenter(self)
        
        if (_state.savedSelection != nil)
        {
            _sizePicker.SetSizeSelected(size: _state.savedSelection!.size)
        } else
        {
            _sizePicker.SetFirstOptionSelected()
        }
    }
    
    func sizeClick(size:T_ShoeSizes)
    {
        sizeClickCallback?(size)
    }
    
    @objc fileprivate func colorClick(color:UIColor)
    {
        colorClickCallback?(color)
    }
    
    @objc fileprivate func leftClick()
    {
        leftClickCallback?()
    }
    
    @objc fileprivate func rightClick()
    {
        rightClickCallback?()
    }
    
    @objc fileprivate func checkoutClick()
    {
        checkoutClickCallback?()
    }
    
    @objc fileprivate func addToCartClick()
    {
        addToCartClickCallback?()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}
