//
//  Test3ViewController.swift
//  protoBlast
//
//  Created by Edward Han on 12/15/16.
//  Copyright © 2016 Edward Han. All rights reserved.
//

import UIKit
import TwitterKit

class Test3ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    
    @IBOutlet weak var contentView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black
        contentView.backgroundColor = UIColor.cyan
        scrollView.delegate = self
        
    }

    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.x)
        let deltaX = scrollView.contentOffset.x
        
        ShapeV3.updateSize(shiftX: deltaX)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    override func viewDidAppear(_ animated: Bool) {
//        let xBox = ShapeV3.spawnBox(message: "test", senderName: "test", idImage: #imageLiteral(resourceName: "Image"), dist: 200, time: 200)
//        
//        contentView.addSubview(xBox)
//        
        
//MARK 
        
        let senders = ["eatalyflatiron", "arsenal", "deadspin"]

        let queue3 = DispatchQueue(label: "fetching", qos: .userInitiated)
      
//        
//        Model.shared.getTweetMessageV2(sender: "eatalyflatiron")
        
        
        Model.shared.getTweetMessageV4(senders: senders){responders in
            for resp in responders {
                self.contentView.addSubview(resp)
 
                let xFactor = (resp.dist / -150) + 11/3
                
                resp.transform = CGAffineTransform(scaleX: xFactor, y: xFactor)
                
            }
        }
        
        

        
        
//        queue3.asyncAfter(deadline: .now() + 5.0 ) {
//            print("SHOULD ADD SUBVIEWS")
//            ShapeV3.shapes[0].makeBox()
//        }
//
        
        
       
    }
    

}


