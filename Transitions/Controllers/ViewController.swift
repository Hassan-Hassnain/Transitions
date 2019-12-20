//
//  ViewController.swift
//  Transitions
//
//  Created by Usama Sadiq on 12/19/19.
//  Copyright © 2019 Usama Sadiq. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    
    @IBOutlet weak var myImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
