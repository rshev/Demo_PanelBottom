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
    @IBOutlet weak var panelView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var longTextLabel: UILabel!
    @IBOutlet weak var panelViewTopConstraint: NSLayoutConstraint!
    
    lazy var panGestureRecognizer: UIPanGestureRecognizer = {
        let gr = UIPanGestureRecognizer(target: self, action: "panGesture:")
        self.panelView.addGestureRecognizer(gr)
        return gr
    }()
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()                  // to refresh cell size on device rotation
        let currentPage = collectionView.contentOffset.x / collectionView.bounds.width
        NSOperationQueue.mainQueue().addOperationWithBlock { 
            self.collectionView.setContentOffset(CGPoint(x: currentPage * self.collectionView.bounds.width, y: 0), animated: false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = panGestureRecognizer                                                // lazily init
        originalPanelPosition = panelViewTopConstraint.constant
        originalPanelAlpha = panelView.alpha
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.nameLabel.text = panelModel.getName()
        self.summaryLabel.text = panelModel.getTextSummary()
        self.longTextLabel.text = panelModel.getTextLong()
    }

    var originalPanelAlpha: CGFloat = 0
    var originalPanelPosition: CGFloat = 0
    var lastPoint: CGPoint = CGPointZero
    
    func setViewAlphas(centerRatio centerRatio: CGFloat) {
        panelView.alpha = originalPanelAlpha + (centerRatio * (1.0 - originalPanelAlpha))
        let howFarFromCenterRatio = 0.5 - centerRatio
        summaryLabel.alpha = howFarFromCenterRatio * 2
        longTextLabel.alpha = -howFarFromCenterRatio * 2
    }
    
    func panGesture(gestureRecognizer: UIPanGestureRecognizer) {
        let point = gestureRecognizer.locationInView(self.view)
        let screenHeight = collectionView.bounds.height
        let centerRatio = (-panelViewTopConstraint.constant + originalPanelPosition) / (screenHeight + originalPanelPosition)
        switch gestureRecognizer.state {
        case .Changed:
            let yDelta = point.y - lastPoint.y
            var newConstant = panelViewTopConstraint.constant + yDelta
            newConstant = newConstant > originalPanelPosition ? originalPanelPosition : newConstant
            newConstant = newConstant < -screenHeight ? -screenHeight : newConstant
            panelViewTopConstraint.constant = newConstant
            setViewAlphas(centerRatio: centerRatio)
        case .Ended:
            self.panelViewTopConstraint.constant = centerRatio < 0.5 ? self.originalPanelPosition : -screenHeight
            UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: [.CurveEaseInOut], animations: {
                self.view.layoutIfNeeded()
                self.setViewAlphas(centerRatio: centerRatio < 0.5 ? 0.0 : 1.0)
                }, completion: nil)
        default:
            break
        }
        lastPoint = point
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
        return collectionView.bounds.size
    }
    
}
