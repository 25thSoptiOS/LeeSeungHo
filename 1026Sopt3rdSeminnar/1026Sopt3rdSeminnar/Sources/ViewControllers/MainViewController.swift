//
//  ViewController.swift
//  1026Sopt3rdSeminnar
//
//  Created by elesahich on 2019/10/26.
//  Copyright © 2019 elesahich. All rights reserved.
//

import UIKit
import CHIPageControl

class MainViewController: UIViewController {
    
    @IBOutlet weak var bannerCV: UICollectionView!
    @IBOutlet weak var paging: CHIPageControlAleppo!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // data Setting
        setBanner()
        // data를 정리해서 넣어주는 소스
        bannerCV.delegate = self
        bannerCV.dataSource = self
        
    }
}
// UICollectionViewDataSource 를 채택합니다.
extension MainViewController: UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //        if collectionView == self.workCV {
        //            return appDelegate.workList.count
        //        }
        return appDelegate.bannerList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //        if collectionView == self.workCV {
        //            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WorkCell", for: indexPath) as! WorkCell
        //
        //            let work = appDelegate.workList[indexPath.row]
        //
        //            cell.workIdx = work.workIdx
        //            cell.workImg.image = work.workMainImg
        //
        //            return cell
        //        }
        //        else {
        let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
        
        let banner = appDelegate.bannerList[indexPath.row]
        bannerCell.Banner?.image = banner.bannerImg
        // bannerCell.banner = bannerList.
        return bannerCell
        //        }
    }
    
    private func scrollDidEndDecelarating(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        let w = scrollView.bounds.size.width
        let currentPage = Int(ceil(x/w))
        print(currentPage)
        self.paging.set(progress: currentPage, animated: true)
    }
    
}
extension MainViewController{
    func setBanner() {
        let banner1 = Banner(bannerName: "mainImage")
        let banner2 = Banner(bannerName: "mainImage02")
        let banner3 = Banner(bannerName: "mainImage03")
        appDelegate.bannerList = [banner1, banner2, banner3]
    }
}
