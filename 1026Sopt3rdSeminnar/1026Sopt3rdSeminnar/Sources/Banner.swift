//
//  Banner.swift
//  1026Sopt3rdSeminnar
//
//  Created by elesahich on 2019/11/01.
//  Copyright © 2019 elesahich. All rights reserved.
//

import Foundation
import UIKit

struct Banner {
    var bannerImg: UIImage?
    
    init(bannerName: String) {
        self.bannerImg = UIImage(named: bannerName)
    }
}
