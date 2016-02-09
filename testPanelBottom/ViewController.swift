//
//  ViewController.swift
//  testPanelBottom
//
//  Created by asdfgh1 on 09/02/16.
//  Copyright © 2016 rshev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var panelModel = SomeModel()                   // for demo purposes, should be given from outside
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        

    }

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return panelModel.getImages().count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("image", forIndexPath: indexPath) as! ImageCollectionViewCell
        if let img = panelModel.getImages()[indexPath.item] {
            cell.imageView.image = img
        }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        print(__FUNCTION__)
        return collectionView.bounds.size
    }
    
}
