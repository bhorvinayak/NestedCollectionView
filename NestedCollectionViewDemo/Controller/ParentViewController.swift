//
//  ParentViewController.swift
//  NestedCollectionViewDemo
//
//  Created by Vinayak Bhor on 27/07/20.
//  Copyright © 2020 Vinayak Bhor. All rights reserved.
//

import UIKit

class ParentViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    //MARK: Declare variable
    var data = generateRandomData()
    //MARK: Decalare outlet
    @IBOutlet weak var outerCollectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    let outerCount = 4
    //MARK: Decalare life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = outerCount
        
    }
   
    //MARK: Collection View delegate methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return outerCount
    }
    
    //MARK: Collection View datasource methods
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OuterCell", for: indexPath) as! OuterCollectionViewCell
        cell.contentView.backgroundColor = .none
        return cell
        
    }
    //MARK:- For Display the page number in page controll of collection view Cell
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let visibleRect = CGRect(origin: self.outerCollectionView.contentOffset, size: self.outerCollectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let visibleIndexPath = self.outerCollectionView.indexPathForItem(at: visiblePoint) {
            self.pageControl.currentPage = visibleIndexPath.row
        }
    }
}
class OuterCollectionViewCell: UICollectionViewCell ,UICollectionViewDataSource,UICollectionViewDelegate {
    
    
    @IBOutlet weak var InnerCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        InnerCollectionView.isHidden = false
        InnerCollectionView.delegate = self
        InnerCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InnerCell", for: indexPath) as! InnerCollectionViewCell
        cell.contentView.backgroundColor = .green
        return cell
    }
    
    
    
}

class InnerCollectionViewCell: UICollectionViewCell{
    
    
}
