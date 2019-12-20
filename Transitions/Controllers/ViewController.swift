//
//  ViewController.swift
//  Transitions
//
//  Created by Usama Sadiq on 12/19/19.
//  Copyright © 2019 Usama Sadiq. All rights reserved.
//

import UIKit



class ViewController: UIViewController  {

    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var button: CustomButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.alpha = 1.0
    }
    
    override func viewWillAppear(_ animated: Bool) {

        button.center.x += view.bounds.width
        myImage.center.y -= view.bounds.height
    }

    override func viewDidAppear(_ animated: Bool) {

        UIView.animate(withDuration: 1.2) {
            self.button.center.x -= self.view.bounds.width
        }

        UIView.animate(withDuration: 1.2) {
            self.myImage.center.y += self.view.bounds.height
        }

    }
    

    @IBAction func performTransition(_ sender: UIButton) {
        
        sender.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)

        UIView.animate(withDuration: 2.0,
                                   delay: 0,
                                   usingSpringWithDamping: CGFloat(0.20),
                                   initialSpringVelocity: CGFloat(6.0),
                                   options: UIView.AnimationOptions.allowUserInteraction,
                                   animations: {
                                    sender.transform = CGAffineTransform.identity
            },
                                   completion: { Void in()  }
        )
        
        //Below code is working
        
//        UIView.animate(withDuration: 0.6,
//        animations: {
//            self.button.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
//        },
//        completion: { _ in
//            UIView.animate(withDuration: 0.6) {
//                self.button.transform = CGAffineTransform.identity
//            }
//        })


        performSegue(withIdentifier: "go", sender: self)
    }
 
    
}
extension ViewController: Scaleable{
    var imageFrame: UIView  {return myImage}
}


//MARK: -

protocol Scaleable {
    var imageFrame: UIView {get}
}
