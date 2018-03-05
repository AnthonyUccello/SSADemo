//
//  X_Navigator.swift
//  SingleStateArchitectureDemo
//
//  Created by Anthony Uccello on 2018-01-04.
//  Copyright © 2018 Anthony Uccello. All rights reserved.
//

import Foundation
import UIKit

class X_Navigator
{
    class func Navigate(controller:UIViewController)
    {
        State.App.navigationStack.append(controller)
        State.App.currentController.present(controller, animated: true)
    }
    
    class func GoBack()
    {
        let controller = State.App.navigationStack.removeLast()
        controller.dismiss(animated: true)
    }
}
