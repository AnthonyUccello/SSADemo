//
//  C_Checkout.swift
//  SingleStateArchitectureDemo
//
//  Created by Anthony Uccello on 2018-01-04.
//  Copyright © 2018 Anthony Uccello. All rights reserved.
//

import Foundation
import UIKit

class C_Checkout : UIViewController
{
    private var _view:V_Checkout!
    
    override func loadView()
    {
        _view = V_Checkout();
        _view.backClickCallback = goBack
        _view.UpdateView()
        view = _view
        
    }
    
    func goBack()
    {
        X_Navigator.GoBack()
    }
}
