//
//  testView.swift
//  Pods
//
//  Created by Edward Han on 12/7/16.
//
//

import UIKit

class testView: UIViewController {

    var boxes = [ShapeV2]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let message = ShapeV2(message: "what", senderName: "me", idImage: #imageLiteral(resourceName: "Image"), dist: 0.4, time: 1)
        let message2 = ShapeV2(message: "what", senderName: "me", idImage: #imageLiteral(resourceName: "Image"), dist: 2.0, time: 2)
        let message3 = ShapeV2(message: "what", senderName: "me", idImage: #imageLiteral(resourceName: "Image"), dist: 1.2, time: 3)
        
        spawnBox(msg: message, superV: self.view)
        spawnBox(msg: message2, superV: self.view)
        spawnBox(msg: message3, superV: self.view)
      
    }

    
    func spawnBox(msg: ShapeV2, superV: UIView) {
        
//        (message: String, senderName: String, idImage: UIImage, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat)
        
        
//        let messageBox = ShapeV2(message: message, senderName: senderName, idImage: idImage)
        superV.addSubview(msg)
        msg.translatesAutoresizingMaskIntoConstraints = false
        superV.translatesAutoresizingMaskIntoConstraints = false
        
        
        //        let sizeX = (-1/35)*dist + 0.189
        //        var sizeFactor = CGFloat()
        //
        //        if sizeX < 0.075 {
        //            sizeFactor = 0.075
        //        }
        //
        //        if sizeX > 0.175 {
        //            sizeFactor = 0.175
        //        }
        //        else {sizeFactor = CGFloat(sizeX)}
        //
        //
        //        let xPosFactor = CGFloat(2.0 - sizeX)
        //        let yPosFactor = 1.0
        
        
        
//        var widthX = CGFloat(Double(arc4random()%9 + 1) * 0.08)
//        var xX = CGFloat(Double(arc4random()%7 + 1) * 0.20)
        let yX = CGFloat(msg.time * 0.20)
//        let widthX = CGFloat((-0.0625 * msg.dist) + 0.205)
//        let xX = CGFloat((-15.0 * widthX) + 2.95)   .27 / .4 ...... .12 / 1.75  delta -8.75
        
        let widthX = CGFloat((-0.09375 * msg.dist) + 0.3075)
        let xX = CGFloat((-8.75 * widthX) + 2.85)
        
        print("\(widthX)" + "widthX")
        print("\(xX)" + "xX")
        print("\(yX)" + "yX")
        
        let widthConstraint = NSLayoutConstraint(item: msg, attribute: .width, relatedBy: .equal, toItem: superV, attribute:.width, multiplier: widthX, constant:0.0)
        let squareConstraint = NSLayoutConstraint(item: msg, attribute: .height, relatedBy: .equal, toItem: msg, attribute:.width, multiplier: 1.0, constant:0.0)
        let xConstraint = NSLayoutConstraint(item: msg, attribute: .centerX, relatedBy: .equal, toItem: superV, attribute: .centerX, multiplier: xX, constant: 0.0)
        let yConstraint = NSLayoutConstraint(item: msg, attribute: .centerY, relatedBy: .equal, toItem: superV, attribute: .centerY, multiplier: yX, constant: 0)
//
//        
        NSLayoutConstraint.activate([widthConstraint, squareConstraint, xConstraint, yConstraint])
        view.addConstraints([widthConstraint, squareConstraint, xConstraint, yConstraint])
        boxes.append(msg)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        for box in boxes {
            box.setCornerRadius()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
