//
//  garbage.swift
//  protoBlast
//
//  Created by Edward Han on 12/6/16.
//  Copyright © 2016 Edward Han. All rights reserved.
//

import Foundation




//this works....gets me the tweet with properties like .text

//
//        let client = TWTRAPIClient()
//        client.loadTweet(withID: "20") { tweet, error in
//            if let t = tweet {
//                self.messageReader.text = t.text
//            } else {
//                print("Failed to load Tweet: \(error?.localizedDescription)")
//            }
//        }

// this doesn't crash, but gives me a value TWTRUser....
//
//        let client = TWTRAPIClient()
//        client.loadUser(withID: "201025452") {(user, error) in
//            if let t = user {
//                print(t)
//                print("success")
//            }
//            else {
//                print("failed")
//            }
//
//        }


//        let client = TWTRAPIClient()
//        let dataSource = TWTRUserTimelineDataSource(screenName: "EatalyFlatiron", apiClient: client)





// this works... gets me back a json with all info on the tweet

//        let client = TWTRAPIClient()
//        let statusesShowEndpoint = "https://api.twitter.com/1.1/statuses/show.json"
//        let params = ["id": "20"]
//        var clientError : NSError?
//
//        let request = client.urlRequest(withMethod: "GET", url: statusesShowEndpoint, parameters: params, error: &clientError)
//
//        client.sendTwitterRequest(request) { (response, data, connectionError) -> Void in
//            if connectionError != nil {
//                print("Error: \(connectionError)")
//            }
//
//            do {
//                let json = try JSONSerialization.jsonObject(with: data!, options: [])
//                print("json: \(json)")
//            } catch let jsonError as NSError {
//                print("json error: \(jsonError.localizedDescription)")
//            }
//        }
//






// for a user timeline with para "id" doesn't work...gives me an error. Where can I find what syntax I use for the parameters I want...




//let logInButton = TWTRLogInButton { (session, error) in
//    if let unwrappedSession = session {
//        let alert = UIAlertController(title: "Logged In",
//                                      message: "User \(unwrappedSession.userName) has logged in",
//            preferredStyle: UIAlertControllerStyle.alert
//        )
//        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
//        self.present(alert, animated: true, completion: nil)
//    } else {
//        NSLog("Login error: %@", error!.localizedDescription);
//    }
//}
//
//logInButton.center = self.view.center
//self.view.addSubview(logInButton)





//        containingView.translatesAutoresizingMaskIntoConstraints = false
//
//
//        let yX = CGFloat(time * 0.20)
//        let widthX = CGFloat((-0.09375 * dist) + 0.3075)
//        let xX = CGFloat((-8.75 * widthX) + 2.85)
//
//
//        widthConstraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: containingView, attribute:.width, multiplier: widthX, constant:0.0)
//        squareConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: self, attribute:.width, multiplier: 1.0, constant:0.0)
//        xConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: containingView, attribute: .centerX, multiplier: xX, constant: 0.0)
//        yConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: containingView, attribute: .centerY, multiplier: yX, constant: 0)
//
//        NSLayoutConstraint.activate(superConstraints)
//        containingView.addConstraints(superConstraints)





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
