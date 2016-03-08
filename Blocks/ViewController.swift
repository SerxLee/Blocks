//
//  ViewController.swift
//  Blocks
//
//  Created by Serx on 3/7/16.
//  Copyright © 2016 serxlee. All rights reserved.
//

import UIKit
import Foundation
import CoreGraphics


class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    private weak var pieceForReset: UIView?


    @IBOutlet weak var pinkBlock: UIView!
    @IBOutlet weak var blueBlock: UIView!
    @IBOutlet weak var greenBlock: UIView!
    
    //create the blocks to move
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
        
        let colorBlocks = [pinkBlock, blueBlock, greenBlock] as [UIView]!
        
        masterAnimagtor = UIDynamicAnimator(referenceView: view)
        gravityBehavior = UIGravityBehavior(items: colorBlocks)

        boundaryCollisionBehavior = UICollisionBehavior(items: colorBlocks)
        boundaryCollisionBehavior.translatesReferenceBoundsIntoBoundary = true
        
        elasticityBehavior = UIDynamicItemBehavior(items: colorBlocks)
        // Usually between 0 (inelastic) and 1 (collide elastically)
        elasticityBehavior.elasticity = 0.6
        
        masterAnimagtor.addBehavior(gravityBehavior)
        masterAnimagtor.addBehavior(boundaryCollisionBehavior)
        masterAnimagtor.addBehavior(elasticityBehavior)
    }
    
    
    
    private func adjustAnchorPointForGestureRecognizer(gestureRecognizer: UIGestureRecognizer) {
        if gestureRecognizer.state == .Began {
            let piece = gestureRecognizer.view!
            let locationInView = gestureRecognizer.locationInView(piece)
            let locationInSuperview = gestureRecognizer.locationInView(piece.superview)
            
            piece.layer.anchorPoint = CGPointMake(locationInView.x / piece.bounds.size.width, locationInView.y / piece.bounds.size.height)
            piece.center = locationInSuperview
        }
    }

    @IBAction func panRecognizer(gestureRecognizer: UIPanGestureRecognizer) {
        let piece = gestureRecognizer.view!
        
        self.adjustAnchorPointForGestureRecognizer(gestureRecognizer)
        
        if gestureRecognizer.state == .Began || gestureRecognizer.state == .Changed {
            let translation = gestureRecognizer.translationInView(piece.superview!)
            
            piece.center = CGPointMake(piece.center.x + translation.x, piece.center.y + translation.y)
            gestureRecognizer.setTranslation(CGPointZero, inView: piece.superview)
            
            
            let colorBlocks = [pinkBlock, blueBlock, greenBlock] as [UIView]!
            
            masterAnimagtor = UIDynamicAnimator(referenceView: view)
            gravityBehavior = UIGravityBehavior(items: colorBlocks)
            
            boundaryCollisionBehavior = UICollisionBehavior(items: colorBlocks)
            boundaryCollisionBehavior.translatesReferenceBoundsIntoBoundary = true
            
            elasticityBehavior = UIDynamicItemBehavior(items: colorBlocks)
            // Usually between 0 (inelastic) and 1 (collide elastically)
            elasticityBehavior.elasticity = 0.6
            
            masterAnimagtor.addBehavior(gravityBehavior)
            masterAnimagtor.addBehavior(boundaryCollisionBehavior)
            masterAnimagtor.addBehavior(elasticityBehavior)
        }
    }
    
    
    @IBAction func RotationRecognizer(gestureRecognizer: UIRotationGestureRecognizer) {
        
        self.adjustAnchorPointForGestureRecognizer(gestureRecognizer)
        
        if gestureRecognizer.state == .Began || gestureRecognizer.state == .Changed {
            gestureRecognizer.view!.transform = CGAffineTransformRotate(gestureRecognizer.view!.transform, gestureRecognizer.rotation)
            gestureRecognizer.rotation = 0
        }
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
        
        
/*
    
    func changeDirection(notification: NSNotification) {
        /*
        
        case Portrait // Device oriented vertically, home button on the bottom
        case PortraitUpsideDown // Device oriented vertically, home button on the top
        case LandscapeLeft // Device oriented horizontally, home button on the right
        case LandscapeRight // Device oriented horizontally, home button on the left
        case FaceUp // Device oriented flat, face up
        case FaceDown // Device oriented flat, face down
        
        */
        if let device = notification.object as? UIDevice{
            
            switch device.orientation{
                
            case .Portrait:
                portraitChange()
            case .PortraitUpsideDown:
                portrainUpsideDownChange()
            case .LandscapeLeft:
                landscapeLeftChange()
            case .LandscapeRight:
                landscapeRightChange()
            case .FaceUp:
                faceUpChange()
            case .FaceDown:
                faceDownChange()
            default:
                return
            }
        }
    }
*/

}

