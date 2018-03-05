//
//  UIViewExtensions.swift
//  ACApp
//
//  Created by Anthony Uccello on 2017-09-14.
//  Copyright © 2017 Infusion. All rights reserved.
//

import Foundation
import UIKit

extension UIView
{
    var setX:CGFloat
    {
        set
        {
            frame = CGRect(x: newValue, y: frame.origin.y, width: frame.width, height: frame.height)
        }
        
        get{ return frame.origin.x}
    }
    
    var setY:CGFloat
    {
        set
        {
            frame = CGRect(x: frame.origin.x, y: newValue, width: frame.width, height: frame.height)
        }
        
        get{ return frame.origin.y}
    }
    
    var setWidth:CGFloat
    {
        set
        {
            frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: newValue, height: frame.height)
        }
        
        get{ return frame.width}
    }
    
    var setHeight:CGFloat
    {
        set
        {
            frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.width, height: newValue)
        }
        
        get{ return frame.height}
    }
    
    var bottomY:CGFloat
    {
        set{}
        get
        {
            return frame.origin.y + frame.height
        }
    }
    
    var rightX:CGFloat
    {
        set{}
        get
        {
            return frame.origin.x + frame.width
        }
    }
    
    // TODO Add relative positioning (these are all absolute)
    func alignCenterXToTargetCenter(_ target:UIView, offset:CGFloat = 0)
    {
        let xTarget = target.frame.origin.x + target.frame.width/2 - frame.width/2 + offset
        frame = CGRect(x: xTarget, y: frame.origin.y, width: frame.width, height: frame.height)
    }
    
    func alignCenterYToTargetCenter(_ target:UIView, offset:CGFloat = 0)
    {
        let yTarget = target.frame.origin.y + target.frame.height/2 - frame.height/2 + offset
        frame = CGRect(x: frame.origin.x, y: yTarget, width: frame.width, height: frame.height)
    }
    
    func alignCenterXAndYToTargetCenter(_ target:UIView)
    {
        alignCenterYToTargetCenter(target)
        alignCenterXToTargetCenter(target)
    }
    
    func alignXToTargetRight(_ target:UIView, offset:CGFloat)
    {
        let xTarget = target.frame.origin.x + target.frame.width + offset
        frame = CGRect(x: xTarget, y: frame.origin.y, width: frame.width, height: frame.height)
    }
    
    func alignYToTargetBottom(_ target:UIView, offset:CGFloat)
    {
        let yTarget = target.frame.origin.y + target.frame.height + offset
        frame = CGRect(x: frame.origin.x, y: yTarget, width: frame.width, height: frame.height)
    }
    
    func alignYToTargetTop(_ target:UIView, offset:CGFloat)
    {
        let yTarget = target.frame.origin.y + offset
        frame = CGRect(x: frame.origin.y, y: yTarget, width: frame.width, height: frame.height)
    }
    
    func removeAllSubviews()
    {
        subviews.forEach { $0.removeFromSuperview() }
    }
    
    func addBackgroundImage(_ name:String)
    {
        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: ViewUtils.GetScreenWidth(), height: ViewUtils.GetScreenHeight()))
        imageViewBackground.image = UIImage(named: name)
        
        imageViewBackground.contentMode = UIViewContentMode.scaleAspectFill
        
        addSubview(imageViewBackground)
        sendSubview(toBack: imageViewBackground)
    }
    
    func addTapGesture(tapNumber:Int, target:Any , action:Selector)
    {
        let tap = UITapGestureRecognizer(target: target, action: action)
        tap.numberOfTapsRequired = tapNumber
        addGestureRecognizer(tap)
        isUserInteractionEnabled = true
    }
    
}

extension UIColor {
    var redValue: CGFloat{ return CIColor(color: self).red }
    var greenValue: CGFloat{ return CIColor(color: self).green }
    var blueValue: CGFloat{ return CIColor(color: self).blue }
    var alphaValue: CGFloat{ return CIColor(color: self).alpha }
}
