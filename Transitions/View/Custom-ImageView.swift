//
//  Custom-ImageView.swift
//  Transitions
//
//  Created by Usama Sadiq on 12/20/19.
//  Copyright © 2019 Usama Sadiq. All rights reserved.
//

import UIKit

@IBDesignable
class Custom_ImageView: UIImageView {

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
         refreshBorder(width: borderWidth)
     }
     
        @IBInspectable var cornerRadius: CGFloat = 15 {
            didSet {
                refreshCorners(value: cornerRadius)
            }
        }
    @IBInspectable var borderWidth: CGFloat = 15 {
           didSet {
               refreshCorners(value: cornerRadius)
                refreshBorder(width: borderWidth)
           }
       }
    
//MARK: - HELPING FUNCTIONS
     func refreshCorners(value: CGFloat) {
         layer.cornerRadius = value
     }
    func refreshBorder(width: CGFloat){
           layer.borderWidth = width
           layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
       }
}
