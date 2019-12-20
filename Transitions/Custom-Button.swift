//
//  Custom-Button.swift
//  Transitions
//
//  Created by Usama Sadiq on 12/20/19.
//  Copyright © 2019 Usama Sadiq. All rights reserved.
//

import UIKit

@IBDesignable class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    func sharedInit() {
        refreshCorners(value: cornerRadius)
    }
    
       @IBInspectable var cornerRadius: CGFloat = 15 {
           didSet {
               refreshCorners(value: cornerRadius)
           }
       }
}


extension CustomButton {
   
    
    func refreshCorners(value: CGFloat) {
        layer.cornerRadius = value
    }
}
