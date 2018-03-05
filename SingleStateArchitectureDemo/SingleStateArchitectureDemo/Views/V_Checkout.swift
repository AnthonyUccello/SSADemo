//
//  V_Checkout.swift
//  SingleStateArchitectureDemo
//
//  Created by Anthony Uccello on 2018-01-04.
//  Copyright © 2018 Anthony Uccello. All rights reserved.
//

import Foundation
import UIKit

class V_Checkout : UIView
{
    public var backClickCallback:(() -> ())?

    private var _PADDING:CGFloat = 10
    private var _scrollView:UIScrollView = UIScrollView(frame: CGRect.zero)
    private var _buyButton:UIButton!
    private var _backButton:UIButton!
    private var _total:UILabel!

    init()
    {
        super.init(frame:CGRect.zero)
        loadView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadView()
    {
        backgroundColor = UIColor.green
        addItemsToScrollview()
        UpdateView()
    }
    
    public func UpdateView()
    {
        _buyButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        _buyButton.setTitle("Buy", for: .normal)
        _buyButton.setY = ViewUtils.GetScreenHeight() - 60
        _buyButton.setX = ViewUtils.GetScreenWidth() / 2 - _buyButton.frame.width / 2
        _buyButton.backgroundColor = UIColor.black
        addSubview(_buyButton)

        _backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        _backButton.setTitle("Back", for: .normal)
        _backButton.setX = 10
        _backButton.setY = ViewUtils.GetScreenHeight() - 60
        _backButton.backgroundColor = UIColor.red
        _backButton.addTarget(self, action: #selector(backClick), for: .touchUpInside)
        addSubview(_backButton)
        
        
        _total = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        _total.text = "Total: $ \(State.App.getTotalPrice())"
        _total.sizeToFit()
        _total.setX = ViewUtils.GetScreenWidth() / 2 - _total.frame.width / 2
        _total.alignCenterYToTargetCenter(_buyButton, offset: -50)
        addSubview(_total)
        
    }

    @objc func backClick()
    {
        backClickCallback?()
    }
    
    private func addItemsToScrollview()
    {
        _scrollView.setWidth = ViewUtils.GetScreenWidth()
        _scrollView.setHeight = ViewUtils.GetScreenHeight() - 150
        _scrollView.backgroundColor = UIColor.white
        _scrollView.isScrollEnabled = true
        addSubview(_scrollView)
        
        var index:CGFloat = 0
        var scrollHeight:CGFloat = 0
        for shoe in State.App.selectedShoes
        {
            let item = W_ImageWithRightLabelAndColor(image: shoe.model.image,
                                                     text: "\(shoe.model.name) $\(shoe.model.price) size: \(MM_ShoeSizeToString.Get(type: shoe.size)) color: ",
                                                     color: shoe.color)
            item.setY = index * (_PADDING + item.frame.height)
            index += 1
            scrollHeight += item.frame.height + _PADDING
            _scrollView.addSubview(item)
        }
        
        _scrollView.contentSize = CGSize(width: ViewUtils.GetScreenWidth(),
                                         height: scrollHeight)
    }
}
