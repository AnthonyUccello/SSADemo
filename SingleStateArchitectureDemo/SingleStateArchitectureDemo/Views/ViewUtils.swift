//
//  ViewUtils.swift
//  ACApp
//
//  Created by Anthony Uccello on 2017-09-14.
//  Copyright © 2017 Infusion. All rights reserved.
//

import Foundation
import UIKit

class ViewUtils
{
    class func GetScreenWidth() -> CGFloat
    {
        return UIScreen.main.bounds.width
    }
    
    class func GetScreenHeight() -> CGFloat
    {
        return UIScreen.main.bounds.height
    }
    
    class func GetNormalizedHeightValue(_ percentHeight:CGFloat) -> CGFloat
    {
        return percentHeight * GetScreenHeight()
    }
    
    class func GetNormalizedWidthValue(_ percentWidth:CGFloat) -> CGFloat
    {
        return percentWidth * GetScreenWidth()
    }
    
    class func StatusBarHeight() -> CGFloat
    {
        return UIApplication.shared.statusBarFrame.height
    }
    
    class func GetScreenSizeRect() -> CGRect
    {
        return CGRect(x: 0, y: 0, width: GetScreenWidth(), height: GetScreenHeight())
    }
}
