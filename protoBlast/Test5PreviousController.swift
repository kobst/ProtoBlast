//
//  Test5JunkViewController.swift
//  protoBlast
//
//  Created by Edward Han on 12/29/16.
//  Copyright © 2016 Edward Han. All rights reserved.
//

import UIKit
import CoreLocation
import TwitterKit

class Test5JunkViewController: UIViewController, UIScrollViewDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var port: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var contentView: UIView!
    
    
    var locationManager = CLLocationManager()
    var myLocation = CLLocation(latitude: 40.7398516, longitude: -73.9924008)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        view.backgroundColor = UIColor.black
        contentView.backgroundColor = UIColor.cyan
        scrollView.delegate = self
        
        
        
        //        for (key, value) in coordinates {
        //            let location = key
        //            let dist = myLocation.distance(from: value)
        //            let roundedDist = Double(round(dist)/1000)
        //            let newDistMapTuple = (location, roundedDist)
        //            distMap.append(newDistMapTuple)
        //        }
        //
        //        let sortedDistMap = distMap.sorted(by: {$0.dist < $1.dist})
        
        
        
        
        
        //        for (x,y) in sortedDistMap {
        //            print("\(x)......sortedDistMap....\(y)")
        //        }
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //        print(scrollView.contentOffset.x)
        let contentDelta = scrollView.contentOffset.x
        
        //       Bubble.updateSize(shiftX: contentDelta)
        ShapeV5.contentShift = contentDelta
        
        ShapeV5.updateSize(shiftX: contentDelta)
        
        ShapeV5.sortList(shiftX: contentDelta)
        
        
        for shape in ShapeV5.allSorted {
            print("\(shape.message.senderID)..\(shape.originX)...\(shape.originY)....")
        }
        
        
        
        
        
        
        
        
        
        //
        //        let testLocation3 = CLLocation(latitude: 40.1, longitude: 73.4)
        //        let testLocation = CLLocation(latitude: 40.7398576, longitude: 73.9912068)
        //        let testLocation2 = CLLocation(latitude: 41.1, longitude: 73.4)
        //
        //        let dist1 = myLocation.distance(from: testLocation)
        //        let dist2 = myLocation.distance(from: testLocation2)
        //        let dist3 = myLocation.distance(from: testLocation3)
        //
        //        let t1 = ("test3", dist1)
        //        let t2 = ("test1", dist2)
        //        let t3 = ("test2", dist3)
        //        let l1 = [t1, t2, t3]
        //        let l2 = l1.sorted(by: {$0.1 < $1.1})
        //        for (key, value) in l2 {
        //            print("\(key)......kv......\(value)")
        
        
        //        for box in ShapeV5.boxesSorted {
        //            box.frame.origin.x = contentDelta
        //        }
        
        
        //        for (index, shape) in ShapeV5.allSorted.enumerated() {
        //            print("....\(index)....\(shape.message.senderID)....\(shape.form)..\n")
        //        }
        
        //        for message in Message.all {
        //            let deltaX = CGFloat(message.dist) - contentDelta
        //            if deltaX < 50 && message.shape == .bubble {
        ////                message.formBubble?.removeFromSuperview()
        //                view.addSubview(message.formBox!)
        //            }
        //
        //        }
        
        
        
    }
    
    
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        //        let contentDelta = scrollView.contentOffset.x
        //        ShapeV5.contentShift = contentDelta
        //        ShapeV5.sortList(shiftX: contentDelta)
        //
        //
        //
        
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        let senders = ["eatalyflatiron", "arsenal", "deadspin", "mobute", "vice", "NYMag", "netw3rk", "coindesk"]
        
        
        
        // works but all shapes disappear on updatesize
        
        //        Model.shared.getTweetMessageV5(senders: senders){responders in
        //            for newMessage in responders {
        //                if newMessage.dist < 50 {
        //                    //                    let newBox = Square(message: newMessage)
        //                    self.contentView.addSubview(newMessage.formBox!)
        //                }
        //                else {
        //                    //                    let newView = Bubble(message: newMessage)
        //                    self.contentView.addSubview(newMessage.formBubble!)
        //                    newMessage.shape = .square
        //                }
        //            }
        //            Bubble.updateSize(shiftX: 0)
        //        }
        //
        
        
        //  this doesn't work with updateSize since shapes that start as bubbles do not change nicely by makeBox. Maybe something to do with transform function which distorts their frames.
        //
        //...using w ShapeV5
        //
        Modelv2.shared.getTweetShapeV5(senders: senders){responders in
            for newMessage in responders {
                self.contentView.addSubview(newMessage)
            }
        }
        
        
        
        //            let test = UIImageView()
        //            test.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        //            test.image = ShapeV5.allSorted[3].message.idImage
        //
        //            let box2 = UIView()
        //            box2.frame = CGRect(x: 200, y: 200, width: 50, height: 50)
        //            //
        //            box2.addSubview(test)
        //
        //            self.view.addSubview(box2)
        //
        
        
        
        
        
        
        let sortedDistMap = Modelv2.shared.mapDistances(myLocation: myLocation)
        
        for (x,y) in sortedDistMap {
            print(".....\(x).....DISTMAP.....\(y)......")
        }
        
        
        Modelv2.shared.getTweetShapeV5_Tuple(senders: sortedDistMap) {responders in
            for newMessage in responders {
                print("\(newMessage.frame.origin.x).....\n......\n....ADDING SUBVIEWS")
                self.contentView.addSubview(newMessage)
            }
        }
        
        
        
        
        
        
        
        //            ShapeV5.updateSize(shiftX: 0)
        //            ShapeV5.sortList(shiftX: 0)
        
        
        
        //        let test2  = ShapeV5.MessageData(message: "is this working", senderName: "tester", idImage: #imageLiteral(resourceName: "Image"), dist: 200, time: 200)
        
        
        
        //
        
        //
        //
        //        let _ = ShapeV5(message: test)
        //
        //        let test2  = ShapeV5.MessageData(message: "is this working", senderName: "tester", idImage: #imageLiteral(resourceName: "Image"), dist: 20, time: 400)
        //
        //
        //        let _ = ShapeV5(message: test2)
        //
        //        let test3  = ShapeV5.MessageData(message: "is this working", senderName: "tester", idImage: #imageLiteral(resourceName: "Image"), dist: 300, time: 40)
        //
        //
        //        let _ = ShapeV5(message: test3)
        //        
        //        var test4  = ShapeV5.MessageData(message: "is this working", senderName: "tester", idImage: #imageLiteral(resourceName: "Image"), dist: 100, time: 140)
        //        
        //        
        //        let _ = ShapeV5(message: test4)
        //        
        //        
        //        test4  = ShapeV5.MessageData(message: "is this working", senderName: "tester", idImage: #imageLiteral(resourceName: "Image"), dist: 80, time: 310)
        //        
        //        
        //        let _ = ShapeV5(message: test4)
        //        
        //        for box in ShapeV5.all {
        //            self.contentView.addSubview(box)
        //        }
        //        
        //        ShapeV5.updateSize(shiftX: 0)
        //        ShapeV5.sortList(shiftX: 0)
        //        
        //        ShapeV5.contentShift = 250
        //        
        //        for box in ShapeV5.allSorted {
        //            print(box.posInScreen ?? "x")
        //        }
        
        
        
    }
    
    
}


