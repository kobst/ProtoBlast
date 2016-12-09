//
//  shapeV2.swift
//  protoBlast
//
//  Created by Edward Han on 12/6/16.
//  Copyright © 2016 Edward Han. All rights reserved.
//

import Foundation

import UIKit






class ShapeV2: UIView {
    
// MARK: CLASS Properties & Methods ----------------------------------------------------------
    
    static var shapes = [ShapeV2]()
    
    class func spawnBox(message: String, senderName: String, idImage: UIImage, dist: CGFloat, time: CGFloat, containingView: UIView) {
        ShapeV2.shapes.append(ShapeV2(message: message, senderName: senderName, idImage: idImage, dist: dist, time: time, containingView: containingView))
    }
    
    class func setCornerRadius() {
        for box in ShapeV2.shapes {
            box.layer.cornerRadius = box.layer.frame.size.width / 2
            box.layer.masksToBounds = true
        }
    }
    
    class func updateConstraints(xDelta: CGFloat, superV: UIView) {
        for shape in ShapeV2.shapes { shape.setConstraints(xDelta: xDelta, superV: superV) }
         setCornerRadius()
    }

    
    
// MARK: INSTANCE Properties & Methods ----------------------------------------------------------
    
    var containingView: UIView
    var messageField: UITextField
    var senderNameField: UILabel
    var idImageView: UIImageView
    var dist: CGFloat
    var time: CGFloat
    
    
    private var widthConstraint = NSLayoutConstraint()
    private var squareConstraint = NSLayoutConstraint()
    private var xConstraint = NSLayoutConstraint()
    private var yConstraint = NSLayoutConstraint()
    
    private var superConstraints: [NSLayoutConstraint] {
        return [widthConstraint, squareConstraint, xConstraint, yConstraint]
    }
    
    init(message: String, senderName: String, idImage: UIImage, dist: CGFloat, time: CGFloat, containingView: UIView) {
        
        messageField = UITextField()
        senderNameField = UILabel()
        idImageView = UIImageView(image: idImage)
        messageField.text = message
        senderNameField.text = senderName
        self.dist = dist
        self.time = time
        self.containingView = containingView
        
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        layer.borderWidth = 2
        layer.borderColor = UIColor.red.cgColor
        layer.cornerRadius = self.layer.frame.size.width / 2
        layer.masksToBounds = true
        
        addSubview(idImageView)
        
        idImageView.translatesAutoresizingMaskIntoConstraints = false
        idImageView.clipsToBounds = true
        idImageView.center = center
        idImageView.layer.masksToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        
        autoresizesSubviews = true
        
        NSLayoutConstraint(item: idImageView, attribute: .width, relatedBy: .equal, toItem: self, attribute:.width, multiplier: 1.0, constant:0.0).isActive = true
        NSLayoutConstraint(item: idImageView, attribute: .height, relatedBy: .equal, toItem: self, attribute:.height, multiplier: 1.0, constant:0.0).isActive = true
        NSLayoutConstraint(item: idImageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: idImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        

        containingView.addSubview(self)
        
        setConstraints(xDelta: 0, superV: containingView)
        
    }
    
    func setConstraints(xDelta: CGFloat, superV: UIView) {
        
        superV.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.deactivate(superConstraints)
        removeConstraints(superConstraints)
        
        let yX = CGFloat(self.time * 0.20)
        let widthX = CGFloat((-0.09375 * (dist + xDelta)) + 0.3075)
        let xX = CGFloat((-8.75 * widthX) + 2.85)
        
        print(widthX)
        
        widthConstraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: superV, attribute:.width, multiplier: widthX, constant:0.0)
        squareConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: self, attribute:.width, multiplier: 1.0, constant:0.0)
        xConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: superV, attribute: .centerX, multiplier: xX, constant: 0.0)
        yConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: superV, attribute: .centerY, multiplier: yX, constant: 0)
        
        NSLayoutConstraint.activate(superConstraints)
        superV.addConstraints(superConstraints)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
