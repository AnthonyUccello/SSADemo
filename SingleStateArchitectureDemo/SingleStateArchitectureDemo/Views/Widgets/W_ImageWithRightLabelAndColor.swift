//
//  ImageWithRightLabel.swift
//  SingleStateArchitectureDemo
//
//  Created by Anthony Uccello on 2018-01-08.
//  Copyright © 2018 Anthony Uccello. All rights reserved.
//

import Foundation
import UIKit

class W_ImageWithRightLabelAndColor:UIView
{
    private let BOX_DIMENSION = 20
    
    var _image:UIImageView!
    var _text:UILabel!
    var _colorView:UIView!

    convenience init(image:UIImage, text:String, color:UIColor)
    {
        self.init(frame:CGRect.zero)
        
        _image = UIImageView(image: image)
        _image.sizeToFit()
        addSubview(_image)
        
        _text = UILabel(frame: CGRect.zero)
        _text.text = text
        _text.sizeToFit()
        _text.setX = _image.frame.width + 20
        addSubview(_text)
        
        setWidth = ViewUtils.GetScreenWidth()
        setHeight = 100
        
        _text.alignXToTargetRight(_image, offset: 10)
        _text.alignCenterYToTargetCenter(_image)
        
        _colorView = UIView(frame: CGRect(x: 0, y: 0, width: BOX_DIMENSION, height: BOX_DIMENSION))
        _colorView.backgroundColor = color
        _colorView.alignCenterYToTargetCenter(_image)
        _colorView.alignXToTargetRight(_text, offset: 10)
        addSubview(_colorView)
        
    }
}
