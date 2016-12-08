//
//  shapeV2.swift
//  protoBlast
//
//  Created by Edward Han on 12/6/16.
//  Copyright © 2016 Edward Han. All rights reserved.
//

import Foundation

import UIKit

  
//    
//    override func didMoveToSuperview() {
//        
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
//        
//        let widthConstraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: superview, attribute:.width, multiplier: sizeFactor, constant:0.0)
//        
//        let squareConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: self, attribute:.height, multiplier: 1.0, constant:0.0)
//        
//        let xConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: superview, attribute: .centerX, multiplier: xPosFactor, constant: 0.0)
//        
//        let yConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: superview, attribute: .centerY, multiplier: 1, constant: 0)
//        
//        
//        
//        self.addConstraints([widthConstraint])
//        self.addConstraints([squareConstraint])
//        self.addConstraints([xConstraint])
//        self.addConstraints([yConstraint])
//        
//    }
    




class ShapeV2: UIView {
    
    
    var messageField: UITextField
    var senderNameField: UILabel
    var idImageView: UIImageView
    var dist: CGFloat
    var time: CGFloat
    
    init(message: String, senderName: String, idImage: UIImage, dist: CGFloat, time: CGFloat){
 
        
        let box = CGRect(x: 0, y: 0, width: 100, height: 100)
        messageField = UITextField()
        senderNameField = UILabel()
        idImageView = UIImageView(image: idImage)
        messageField.text = message
        senderNameField.text = senderName
        self.dist = dist
        self.time = time
        
        super.init(frame: box)
        
    
        layer.borderWidth = 2
        layer.borderColor = UIColor.red.cgColor
        layer.cornerRadius = self.layer.frame.size.width / 2
        layer.masksToBounds = true
        
        addSubview(idImageView)
        
        idImageView.translatesAutoresizingMaskIntoConstraints = false
        idImageView.clipsToBounds = true
        idImageView.center = self.center
        idImageView.layer.masksToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
  
        self.autoresizesSubviews = true

        NSLayoutConstraint(item: idImageView, attribute: .width, relatedBy: .equal, toItem: self, attribute:.width, multiplier: 1.0, constant:0.0).isActive = true

        NSLayoutConstraint(item: idImageView, attribute: .height, relatedBy: .equal, toItem: self, attribute:.height, multiplier: 1.0, constant:0.0).isActive = true

        NSLayoutConstraint(item: idImageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(item: idImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setCornerRadius() {
        layer.cornerRadius = self.layer.frame.size.width / 2
        layer.masksToBounds = true
        
    }
    
    
}
