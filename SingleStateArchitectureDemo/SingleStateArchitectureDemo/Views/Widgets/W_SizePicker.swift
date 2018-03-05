//
//  W_SizePicker.swift
//  SingleStateArchitectureDemo
//
//  Created by Anthony Uccello on 2018-01-04.
//  Copyright © 2018 Anthony Uccello. All rights reserved.
//

//
//  W_Picker.swift
//  SingleStateArchitectureDemo
//
//  Created by Anthony Uccello on 2018-01-04.
//  Copyright © 2018 Anthony Uccello. All rights reserved.
//

import Foundation
import UIKit

class W_SizePicker : UIView
{
    public var clickCallback:((T_ShoeSizes) -> ())?
    
    private var views:[UIImageView] = []
    
    private let BOX_DIMENSION = 50
    private let PADDING = 10
    
    init(_ sizes:[T_ShoeSizes])
    {
        super.init(frame:CGRect.zero)
        
        ChangeSizes(sizes)
    }
    
    public func ChangeSizes(_ sizes:[T_ShoeSizes])
    {
        for view in views
        {
            view.removeFromSuperview()
        }
        
        views = []
        
        var i = 0
        for size in sizes
        {
            var sizeView = UIImageView(frame: CGRect(x: i * (BOX_DIMENSION + PADDING), y: 0, width: BOX_DIMENSION, height: BOX_DIMENSION))
            sizeView.image = MM_ShoeSizeToImage.Get(type: size)
            var tap = TapData(target: self, action: #selector(clickedCallback))
            tap.size = size
            sizeView.addGestureRecognizer(tap)
            sizeView.isUserInteractionEnabled = true
            sizeView.layer.borderColor = UIColor.red.cgColor
            addSubview(sizeView)
            views.append(sizeView)
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
        clickCallback?(tap.size)
    }
    
    public func SetSizeSelected(size:T_ShoeSizes)
    {
        clearBorders()
        for view in views
        {
            if (view.image == MM_ShoeSizeToImage.Get(type: size))
            {
                view.layer.borderWidth = 5
            }
        }
    }
    
    public func SetFirstOptionSelected()
    {
        clearBorders()
        views[0].layer.borderWidth = 5
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
    var size:T_ShoeSizes!
}

