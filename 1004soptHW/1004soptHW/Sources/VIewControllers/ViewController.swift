//
//  ViewController.swift
//  1004soptHW
//
//  Created by elesahich on 04/10/2019.
//  Copyright © 2019 elesahich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var instaImageVIew: UIImageView!
    @IBOutlet weak var HeartImage: UIButton!
    @IBOutlet weak var popUpText: UILabel!
    
    var isPressed = false
    func isHeartPressed(On:Bool) {
        
    }
    @IBAction func isHeartTapped(_ sender: Any) {
        isPressed = !isPressed
 
        HeartImage.setImage(isPressed ?        #imageLiteral(resourceName: "fullHeart") : #imageLiteral(resourceName: "blankHeart"), for: .normal)
    }
    @IBAction func popUpSomeOneLike(_ sender: Any) {
        if (isPressed == true) {
            self.popUpText.text = "Sopt.iOS.lover님이 좋아합니다."
        }
        else {
            self.popUpText.text = " "
        }
    }
}

