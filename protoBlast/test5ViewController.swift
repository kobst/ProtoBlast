//
//  Test3ViewController.swift
//  protoBlast
//
//  Created by Edward Han on 12/15/16.
//  Copyright © 2016 Edward Han. All rights reserved.
//

import UIKit
import TwitterKit
import SpriteKit

class Test5ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    @IBOutlet weak var contentView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        contentView.backgroundColor = UIColor.cyan
        scrollView.delegate = self
        print("-------start VERSION 5-------")
        
        
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //        print(scrollView.contentOffset.x)
        let deltaX = scrollView.contentOffset.x
        
        Bubble.updateSize(shiftX: deltaX)
        
//        ShapeV5.updateSize(shiftX: deltaX)
        
        
    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
 
        let senders = ["eatalyflatiron", "arsenal", "deadspin", "mobute", "vice"]
        
  
        
        
//        
        Model.shared.getTweetMessageV5(senders: senders){responders in
            for newMessage in responders {
                if newMessage.dist < 100 {
                    //                    let newBox = Square(message: newMessage)
                    self.contentView.addSubview(newMessage.formBox!)
                }
                else {
                    //                    let newView = Bubble(message: newMessage)
                    self.contentView.addSubview(newMessage.formBubble!)
                    
                }
            }
            
        }
        
        
        
//  this doesn't work with updateSize since shapes that start as bubbles do not change nicely by makeBox. Maybe something to do with transform function which distorts their frames.
//
//...using w ShapeV5
//        
//        Model.shared.getTweetShapeV5(senders: senders){responders in
//            for newMessage in responders {
//                self.contentView.addSubview(newMessage)
//            }
//            
//            ShapeV5.updateSize(shiftX: 0)
//            
//        }
        
        
        
        
        
        
    
        
        
    }
    
    
}



