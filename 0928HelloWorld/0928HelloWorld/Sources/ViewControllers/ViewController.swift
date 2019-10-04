//
//  ViewController.swift
//  0928HelloWorld
//
//  Created by elesahich on 28/09/2019.
//  Copyright © 2019 elesahich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainUI: UILabel!
    @IBAction func anyAction(_ sender: Any) {
        self.mainUI.text = "SOPT!"
    }
}
