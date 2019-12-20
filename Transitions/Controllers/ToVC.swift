//
//  toVC.swift
//  Transitions
//
//  Created by Usama Sadiq on 12/19/19.
//  Copyright © 2019 Usama Sadiq. All rights reserved.
//

import UIKit

class ToVC: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    var img: UIImage? {
        didSet{
            updateViewForImage()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    fileprivate func updateViewForImage() {
      if let myImage = image {
        image.image = myImage.image
      }
    }
}
