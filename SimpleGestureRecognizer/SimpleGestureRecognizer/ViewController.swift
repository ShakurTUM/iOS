//
//  ViewController.swift
//  SimpleGestureRecognizer
//
//  Created by Shakur AL Islam on 24/2/19.
//  Copyright © 2019 Shakur AL Islam. All rights reserved.
//

import UIKit

let SCREEN_HEIGHT = UIScreen.main.bounds.size.height;
let SCREEN_WIDTH = UIScreen.main.bounds.size.width;

class ViewController: UIViewController {
    
    //MARK: Outlet Object
    @IBOutlet var panGestureMinion: UIPanGestureRecognizer!
    @IBOutlet var minionImageView: UIImageView!
    
    //MARK: View Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializePanGesture();
    }
    
    //MARK: Gesture Initialization
    func initializePanGesture() ->Void{
        self.minionImageView.isUserInteractionEnabled = true;
        let panRecognizer = UIPanGestureRecognizer(target: self,  action:#selector(handleTap(recognizer:)))
        panRecognizer.delegate = self
        self.minionImageView.addGestureRecognizer(panRecognizer)
    }
    
    //MARK: Handle Tap
    @objc func handleTap(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x, y:view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: self.view)
        
        if recognizer.state == UIGestureRecognizer.State.ended {
            let velocity = recognizer.velocity(in: self.view)
            let magnitude = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y))
            
            let slideMultiplier = magnitude / 200
            let slideFactor = 0.1 * slideMultiplier
            
            print(magnitude," ", slideMultiplier," ", slideFactor)

            var endPoint = CGPoint(x:recognizer.view!.center.x + (velocity.x * slideFactor), y:recognizer.view!.center.y + (velocity.y * slideFactor))
            endPoint.x = min(max(endPoint.x, 0), SCREEN_WIDTH)
            endPoint.y = min(max(endPoint.y, 0), SCREEN_HEIGHT)

            UIView.animate(withDuration: Double(slideFactor * 2), delay: 0, options: UIView.AnimationOptions.curveEaseOut, animations: {
                recognizer.view!.center = endPoint
            },completion: nil)
        }
    }
}

extension ViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
