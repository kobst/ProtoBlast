//
//  shape4.swift
//  protoBlast
//
//  Created by Edward Han on 12/20/16.
//  Copyright © 2016 Edward Han. All rights reserved.
//

import Foundation
import Geometry






class ShapeV4: UIView {
    
    // MARK: CLASS Properties & Methods ----------------------------------------------------------
    
    static var shapes = [ShapeV4]()
    
    enum ShapeType {
        case bubble
        case square
    }
    
    
    var type : ShapeType = .bubble {
        didSet {
            switch type {
            case .bubble:
                layer.frame =  CGRect(x: layer.frame.origin.x, y: layer.frame.origin.y, width: 30 , height: 30)
                layer.cornerRadius = layer.frame.size.width / 2
          
            
            case .square:
                layer.cornerRadius = 0
                let boxSize = CGSize(width: 120, height: 60)
                layer.frame = CGRect(origin: layer.frame.origin, size: boxSize)
            }
        }
    }
    

    
    class func updateSize(shiftX: CGFloat) {
        
        
        for shape in ShapeV4.shapes {
            let deltaX = shape.dist - shiftX
            let xFactor = (deltaX / -150) + 11/3
//            print("\(xFactor)---------")
           
            if deltaX < 50 && deltaX > -20 {
                shape.type = ShapeType.square
            }
                
            else {
                if shape.type == ShapeType.square {
                    shape.type = ShapeType.bubble
                    
                }
                shape.transform = CGAffineTransform(scaleX: xFactor, y: xFactor)
            }
            
        }
        
    }
    
    
    
    
    class func spawnBox(message: String, senderName: String, idImage: UIImage, dist: CGFloat, time: CGFloat) -> ShapeV4 {
        let shape = ShapeV4(message: message, senderName: senderName, idImage: idImage, dist: dist, time: time)
        ShapeV4.shapes.append(shape)
        return shape
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
        //        super.init(frame: CGRect(x: dist, y: time, width: CGFloat(sized), height: CGFloat(sized)))
        
        
        
        //        super.init(frame: CGRect(x: dist, y: time, width: origSize, height: origSize))
        
        
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

