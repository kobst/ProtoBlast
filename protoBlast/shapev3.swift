//
//  shapev3.swift
//  protoBlast
//
//  Created by Edward Han on 12/15/16.
//  Copyright © 2016 Edward Han. All rights reserved.
//

import Foundation
import UIKit





class ShapeV3: UIView {
    
    // MARK: CLASS Properties & Methods ----------------------------------------------------------
    
    static var shapes = [ShapeV3]()
    
    
    
    func makeBox(_ contentEdge: CGFloat) {
        self.frame = CGRect(x: contentEdge, y: self.time, width: 170, height: 100)
        self.layer.cornerRadius = self.layer.frame.size.width / 8
        self.layer.masksToBounds = true
    }
    
    class func spawnBox(message: String, senderName: String, idImage: UIImage, dist: CGFloat, time: CGFloat) -> ShapeV3 {
        let shape = ShapeV3(message: message, senderName: senderName, idImage: idImage, dist: dist, time: time)
        ShapeV3.shapes.append(shape)
        return shape
    }
    
    
    
    
    class func updateSize(shiftX: CGFloat) {
  
        // setting the original size proportinal to dist
//        let xfactor = (100 + shiftX) / 100
//        for box in ShapeV3.shapes {
//            box.transform = CGAffineTransform(scaleX: xfactor, y: xfactor)
//        }
//        

//        
        for shape in ShapeV3.shapes {
            let deltaX = shape.dist - shiftX
            
            let xFactor = (deltaX / -150) + 11/3
            
            shape.transform = CGAffineTransform(scaleX: xFactor, y: xFactor)
            
            if deltaX < 50 {
                shape.makeBox(shiftX)
            }
            
        }
        
        
        
    }
    
    class func setCornerRadius() {
        for box in ShapeV2.shapes {
            box.layer.cornerRadius = box.layer.frame.size.width / 2
            box.layer.masksToBounds = true
            print("SCR: \(box.frame, box.layer.cornerRadius)\n\n")
        }
        
    }
    
    
    // MARK: INSTANCE Properties & Methods ----------------------------------------------------------
    
    //    var containingView: UIView
    var messageField: UITextField
    var senderNameField: UILabel
    var idImageView: UIImageView
    var dist: CGFloat
    var time: CGFloat
    
    private var origSize: CGFloat {
        let maxSize = CGFloat(110)
        let minSize = CGFloat(30)
        let factor = CGFloat(-0.35)
        let computedRaw = factor*(dist) + 148.5
        let computedMin = min(minSize, computedRaw)
        let computedMM = max(computedMin, maxSize)
        return CGFloat(computedMM)
    }
    
    init(message: String, senderName: String, idImage: UIImage, dist: CGFloat, time: CGFloat) {
        
        
        messageField = UITextField()
        senderNameField = UILabel()
        idImageView = UIImageView(image: idImage)
        messageField.text = message
        senderNameField.text = senderName
        self.dist = dist
        self.time = time
      
//        let sized = -0.38 * dist + 150.5
        
 //        super.init(frame: CGRect(x: dist, y: time, width: origSize, height: origSize))
//        super.init(frame: CGRect(x: dist, y: time, width: CGFloat(sized), height: CGFloat(sized)))
//
        super.init(frame: CGRect(x: dist, y: time, width: 30 , height: 30))

        
  
        
        idImageView.frame = self.frame
        layer.borderWidth = 2
        layer.borderColor = UIColor.red.cgColor
        layer.cornerRadius = layer.frame.size.width / 2
        layer.masksToBounds = true
        layer.zPosition = -1 * dist
        
        addSubview(idImageView)
        
        
        idImageView.translatesAutoresizingMaskIntoConstraints = false
        idImageView.clipsToBounds = true
        idImageView.center = center
        idImageView.layer.masksToBounds = true
        
        idImageView.contentMode = UIViewContentMode.scaleAspectFill
        
        

        
        translatesAutoresizingMaskIntoConstraints = false
        
        autoresizesSubviews = true
        
        
    
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

