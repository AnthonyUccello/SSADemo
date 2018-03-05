//
//  W_Picker.swift
//  SingleStateArchitectureDemo
//
//  Created by Anthony Uccello on 2018-01-04.
//  Copyright © 2018 Anthony Uccello. All rights reserved.
//

import Foundation
import UIKit

class W_ColorPicker : UIView
{
    public var clickCallback:((UIColor) -> ())?
    
    private var views:[UIView] = []
    
    private let BOX_DIMENSION = 50
    private let PADDING = 10
    
    init(colors:[UIColor])
    {
        super.init(frame:CGRect.zero)
        
        ChangeColors(colors)
    }
    
    public func ChangeColors(_ colors:[UIColor])
    {
        for view in views
        {
            view.removeFromSuperview()
        }
        
        views = []
        
        var i = 0
        for color in colors
        {
            var colorView = UIView(frame: CGRect(x: i * (BOX_DIMENSION + PADDING), y: 0, width: BOX_DIMENSION, height: BOX_DIMENSION))
            colorView.backgroundColor = color
            var tap = TapData(target: self, action: #selector(clickedCallback))
            tap.color = color
            colorView.layer.borderColor = UIColor.white.cgColor
            colorView.addGestureRecognizer(tap)
            addSubview(colorView)
            views.append(colorView)
            i += 1
        }
        
        setWidth = CGFloat(i * BOX_DIMENSION + PADDING)
        setHeight = CGFloat(BOX_DIMENSION)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc fileprivate func clickedCallback(tap:TapData)
    {
        clearBorders()

        tap.view?.layer.borderWidth = 5
        
        clickCallback?(tap.color)
    }
    
    public func SetFirstOptionSelected()
    {
        clearBorders()
        views[0].layer.borderWidth = 5
    }
    
    public func SetColorSelected(color:UIColor)
    {
        for view in views
        {
            if (view.backgroundColor == color)
            {
                view.layer.borderWidth = 5
            }
        }
    }
    
    private func clearBorders()
    {
        for view in views
        {
            view.layer.borderWidth = 0
        }
    }
}

private class TapData : UITapGestureRecognizer
{
    var color:UIColor!
}
