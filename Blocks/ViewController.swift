//
//  ViewController.swift
//  Blocks
//
//  Created by Serx on 3/7/16.
//  Copyright © 2016 serxlee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var Block1: UIView = {
        let view = UIView(frame: CGRect(x: 125.0, y: 190.0, width: 50.0, height: 50.0))
        view.backgroundColor = UIColor.orangeColor()
        return view
    }()
    var masterAnimagtor: UIDynamicAnimator!
    
    var gravityBehavior: UIGravityBehavior!
    
    var boundaryCollisionBehavior: UICollisionBehavior!
    
    var elasticityBehavior: UIDynamicItemBehavior!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //add the block views to the master view
        view.addSubview(Block1)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "changeDirection:", name: UIDeviceOrientationDidChangeNotification, object: UIDevice.currentDevice())

        masterAnimagtor = UIDynamicAnimator(referenceView: view)
        gravityBehavior = UIGravityBehavior(items: [Block1])
        
        boundaryCollisionBehavior = UICollisionBehavior(items: [Block1])
        boundaryCollisionBehavior.translatesReferenceBoundsIntoBoundary = true
        
        elasticityBehavior = UIDynamicItemBehavior(items: [Block1])
        // Usually between 0 (inelastic) and 1 (collide elastically)
        elasticityBehavior.elasticity = 0.6
        
        masterAnimagtor.addBehavior(gravityBehavior)
        masterAnimagtor.addBehavior(boundaryCollisionBehavior)
        masterAnimagtor.addBehavior(elasticityBehavior)
    }
    
    func changeDirection(notification: NSNotification) {
        
        
        /*
            // Device oriented vertically, home button on the bottom
        case Portrait
        case PortraitUpsideDown // Device oriented vertically, home button on the top
        case LandscapeLeft // Device oriented horizontally, home button on the right
        case LandscapeRight // Device oriented horizontally, home button on the left
        case FaceUp // Device oriented flat, face up
        case FaceDown // Device oriented flat, face down
        
        */

    }
    
    //MARK: the device oriented
    func portraitChange(){
        
    }
    
    func portrainUpsideDownChange(){
        
    }
    
    func landscapeLeftChange(){
        
    }
    
    func landscapeRightChange(){
        
    }
    
    func faceUpChange(){
        
    }
    
    func faceDownChange(){
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

