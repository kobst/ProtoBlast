//
//  garbage.swift
//  protoBlast
//
//  Created by Edward Han on 12/6/16.
//  Copyright © 2016 Edward Han. All rights reserved.
//

import Foundation



//class testShape2: UIView {
//    var messageField: UITextField
//    var senderNameField: UILabel
//    var idImageView: UIImageView
//    var time: Double
//    var dist: Double
//    
//    init(message: String, senderName: String, idImage: UIImage, time: Double, dist: Double){
//        
//        messageField = UITextField()
//        senderNameField = UILabel()
//        idImageView = UIImageView(image: idImage)
//        self.time = time
//        self.dist = dist
//        messageField.text = message
//        senderNameField.text = senderName
//        let initialRect = CGRect(x: 50, y: 50, width: 100, height: 100)
//        
//        super.init(frame: initialRect)
//        
//        layer.borderWidth = 2
//        layer.borderColor = UIColor.red.cgColor
//        layer.cornerRadius = self.layer.frame.size.width / 2
//        
//        addSubview(idImageView)
//        
//        self.translatesAutoresizingMaskIntoConstraints = false
//        idImageView.translatesAutoresizingMaskIntoConstraints = false
//        idImageView.clipsToBounds = true
//        idImageView.layer.masksToBounds = true
//        //        senderNameField.translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint(item: idImageView, attribute: .width, relatedBy: .equal, toItem: self, attribute:.width, multiplier: 1.0, constant:0.0).isActive = true
//        
//        NSLayoutConstraint(item: idImageView, attribute: .height, relatedBy: .equal, toItem: self, attribute:.height, multiplier: 1.0, constant:0.0).isActive = true
//        
//        NSLayoutConstraint(item: idImageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
//        
//        NSLayoutConstraint(item: idImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
//        
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//}
//



//        switch sender.state {
//        case .began:
//            draggingTarget＆ = targets＆🅐[sender.targetNumber＃]
//        case .changed where draggingTarget＆.isNotNilⓑ():
//            draggingTarget＆!.center = CGPoint(x: draggingTarget＆!.center.x + panVectorⓖ².x, y: draggingTarget＆!.center.y + panVectorⓖ².y)
//            sender.setTranslation(CGPoint(x: 0, y: 0), in: view)
//        case .ended: draggedTargetⓘ＆ = nil
//        default: break
//        }
//        if let translation = sliderPGR.translationInView(self.view)
//        if let myView = sliderPGR.view {
//            myView.center = CGPoint(x: myView.center.x + translation.x, y: myView.center.y + translation.y)
//        }
//        recognizer.setTranslation(CGPointZero, inView: self.view)
//    }
//
//
//
//    }

//        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
//
//            switch swipeGesture.direction {
//
//            case UISwipeGestureRecognizerDirection.right:
//                print("User Swiped Right")
//            case UISwipeGestureRecognizerDirection.left:
//                print("User Swiped Left")
//            default:
//                break
//
//            }
//
//
//        }




//        let testShape = StackedShape(message: "testesttest", senderName: "id", idImage: image, xx: 50, yy: 200)
//        let testShape2 = StackedShape(message: "testesttest", senderName: "id", xx: 120, yy: 20)
//        let testShape3 = StackedShape(message: "testesttest", senderName: "id", xx: 160, yy: 100)





//    tapGR＆ = UITapGestureRecognizer(target: self, action: #selector(ComposerVC.viewTapped(sender:)))
//    tapGR＆.delegate = self
//    view.addGestureRecognizer(tapGR＆)





//    @IBAction func search(_ sender: Any) {
//        let terms = searchField.text!
//
//        let encodedText = terms.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
//
//        str = String(format: "https://maps.googleapis.com/maps/api/geocode/json?address=%@&sensor=false", encodedText);
//
//        fetchData() { result in
//            self.textView.text = result
//        }
//
//    }


//
//
//class StackedShapeOld: UIView {
//    
//    
//    var messageField: UITextField
//    var senderNameField: UILabel
//    var idImageView: UIImageView
//    
//    //    var backImageView: UIImageView
//    //    init(message: String, senderName: String, backgroundImage: UIImage, idImage: UIImage, frame: CGRect) {
//    //
//    //    init(message: String, senderName: String, idImage: UIImage, frame: CGRect)
//    
//    init(message: String, senderName: String, idImage: UIImage, xx: CGFloat, yy: CGFloat){
//        //        backImageView.image = backgroundImage
//        //        idImageView.image = idImage
//        
//        
//        //        self.backImageView = UIImageView()
//        //        self.backImageView = UIImageView(image: backgroundImage)
//        //        self.idImageView = UIImageView()
//        
//        
//        
//        
//        
//        
//        
//        let box = CGRect(x: xx, y: yy, width: 100, height: 100)
//        messageField = UITextField()
//        senderNameField = UILabel()
//        idImageView = UIImageView(image: idImage)
//        messageField.text = message
//        senderNameField.text = senderName
//        
//        super.init(frame: box)
//        
//        
//        //        let backImageView = UIImageView(image: backgroundImage)
//        //        backImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        
//        //        let idImageView = UIImageView(image: idImage)
//        //        idImageView.frame = self.frame
//        
//        //        let messageField = UITextField()
//        //        messageField.frame = CGRect(x: 50, y: 50, width: 75, height: 75)
//        
//        
//        //        let senderNameField = UILabel()
//        
//        //        senderNameField.frame = CGRect(x: 100, y: 100, width: 25, height: 25)
//        
//        //        self.backgroundColor = UIColor.red
//        
//        
//        layer.borderWidth = 2
//        layer.borderColor = UIColor.red.cgColor
//        layer.cornerRadius = self.layer.frame.size.width / 2
//        layer.masksToBounds = true
//        
//        
//        //        let margins = self.layoutMarginsGuide
//        //
//        //        idImageView.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 1.0)
//        //        idImageView.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
//        addSubview(idImageView) // this will be subviews[1]
//        
//        idImageView.translatesAutoresizingMaskIntoConstraints = false
//        idImageView.clipsToBounds = true
//        idImageView.layer.masksToBounds = true
//        //        senderNameField.translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint(item: idImageView, attribute: .width, relatedBy: .equal, toItem: self, attribute:.width, multiplier: 1.0, constant:0.0).isActive = true
//        
//        NSLayoutConstraint(item: idImageView, attribute: .height, relatedBy: .equal, toItem: self, attribute:.height, multiplier: 1.0, constant:0.0).isActive = true
//        
//        
//        NSLayoutConstraint(item: idImageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
//        
//        
//        NSLayoutConstraint(item: idImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
//        
//        //        NSLayoutConstraint(item: idImageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leadingMargin, multiplier: 1.0, constant: 0.0).isActive = true
//        //
//        //        NSLayoutConstraint(item: idImageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
//        
//        
//        //
//        //        NSLayoutConstraint(item: senderNameField, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0.0).isActive = true
//        
//        
//        //      addSubview(backImageView) // this will be subviews[0]
//        //        addSubview(idImageView) // this will be subviews[1]
//        //      addSubview(messageField)
//        //        addSubview(senderNameField)
//        
//        
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func setFrame_(_ newFrame: CGRect) {
//        frame = newFrame
//    }
//    
//    
//    func move(xy: CGFloat) {
//        
//        
//        
//    }
//    
//}
//





//let testBox = ShapeV2(message: "test", senderName: "idname", idImage: #imageLiteral(resourceName: "Image"), xx: 50, yy: 200)
//view.addSubview(testBox)
////        testBox.backgroundColor = UIColor.red
//
//testBox.translatesAutoresizingMaskIntoConstraints = false
//view.translatesAutoresizingMaskIntoConstraints = false
//
////
//let widthConstraint = NSLayoutConstraint(item: testBox, attribute: .width, relatedBy: .equal, toItem: view, attribute:.width, multiplier: 0.50, constant:0.0)
////
//let squareConstraint = NSLayoutConstraint(item: testBox, attribute: .height, relatedBy: .equal, toItem: testBox, attribute:.width, multiplier: 1.0, constant:0.0)
//
//let xConstraint = NSLayoutConstraint(item: testBox, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0)
//
//let yConstraint = NSLayoutConstraint(item: testBox, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 0.75, constant: 0)
//
//
//NSLayoutConstraint.activate([widthConstraint, squareConstraint, xConstraint, yConstraint])
//view.addConstraints([widthConstraint, squareConstraint, xConstraint, yConstraint])


//        let testBox2 = ShapeV2(message: "test", senderName: "idname", idImage: #imageLiteral(resourceName: "Image"), xx: 50, yy: 200)
//
//        view.addSubview(testBox2)
//
//        testBox2.translatesAutoresizingMaskIntoConstraints = false
//
//
//        let widthConstraintA = NSLayoutConstraint(item: testBox2, attribute: .width, relatedBy: .equal, toItem: view, attribute:.width, multiplier: 0.25, constant:0.0)
//        //
//        let squareConstraintA = NSLayoutConstraint(item: testBox2, attribute: .height, relatedBy: .equal, toItem: testBox2, attribute:.width, multiplier: 1.0, constant:0.0)
//
//        let xConstraintA = NSLayoutConstraint(item: testBox2, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.5, constant: 0.0)
//
//        let yConstraintA = NSLayoutConstraint(item: testBox2, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 0.35, constant: 0)
//
//
//        NSLayoutConstraint.activate([widthConstraintA, squareConstraintA, xConstraintA, yConstraintA])
//        view.addConstraints([widthConstraintA, squareConstraintA, xConstraintA, yConstraintA])



//boxes.append(testBox)
