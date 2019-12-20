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
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        myImage.center.y -= view.bounds.height
        button.center.x += view.bounds.width
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
