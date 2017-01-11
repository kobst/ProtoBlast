//
//  Test3ViewController.swift
//  protoBlast
//
//  Created by Edward Han on 12/15/16.
//  Copyright © 2016 Edward Han. All rights reserved.
//

import UIKit
import TwitterKit
import CoreLocation


// uiviewtransitioningdelegate
//uiviewcontroller animated transitioning....from 0.5, 0.5 of tappedmEssage to 0.5, 0.5 containerView.frame.width/2 containerView.frame.height/2 **container view not contentView...

// on tap, call segue....in prepare for segue, case 'todetail' then segueSource is self.viewcontroller

class Test5ViewController: UIViewController, UIScrollViewDelegate, CLLocationManagerDelegate, UIGestureRecognizerDelegate {
    
    var windowSize = UIScreen.main.bounds
    
    var tappedShape: ShapeV5?
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var contentView: UIView!
    
//    var mapScroll = UIScrollView()
    var map = UIView()
    
    
//    let result = UIColor(red: 86, green: 19, blue: 19, alpha: 1)
    let result = UIColor(red: 60/355, green: 184/255, blue: 250/255, alpha: 1)
//    
    var locationManager = CLLocationManager()
    var myLocation = CLLocation(latitude: 40.7398516, longitude: -73.9924008)
    
//    let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        view.backgroundColor = UIColor.black
        contentView.backgroundColor = result
        scrollView.delegate = self
        
    
        view.addSubview(map)
        
//        mapScroll.backgroundColor = UIColor.black
//        mapScroll.translatesAutoresizingMaskIntoConstraints = false
//        mapScroll.delegate = self
        map.backgroundColor = UIColor.black
        map.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = NSLayoutConstraint(item: map, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: map, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: map, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.width, multiplier: 0.9, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: map, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.height, multiplier: 0.15, constant: 0)
        
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        
        
//        let tap = UITapGestureRecognizer(target: self, action: Selector(("handleTap:")))
//        tap.delegate = self
//        view.addGestureRecognizer(tap)
        
        
//        view.addSubview(port)
        
//        mapScroll.addSubview(map)
//        
//        let horizontalConstraintMap = NSLayoutConstraint(item: map, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: mapScroll, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
//        let verticalConstraintMap = NSLayoutConstraint(item: map, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: mapScroll, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: 0)
//        let widthConstraintMap = NSLayoutConstraint(item: map, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: mapScroll, attribute: NSLayoutAttribute.width, multiplier: 1, constant: 0)
//        let heightConstraintMap = NSLayoutConstraint(item: map, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: mapScroll, attribute: NSLayoutAttribute.height, multiplier: 3.5, constant: 0)
////
////        
//        mapScroll.contentSize.width = map.bounds.size.width
//        mapScroll.contentSize.height = map.bounds.size.height * 2
//        
//        mapScroll.addConstraints([horizontalConstraintMap, verticalConstraintMap, widthConstraintMap, heightConstraintMap])
 
//


    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //        print(scrollView.contentOffset.x)
        let contentDeltaX = scrollView.contentOffset.x
        let contentDeltaY = scrollView.contentOffset.y
        
        
        print("scrolling....")
//       Bubble.updateSiztae(shiftX: contentDelta)
        ShapeV5.contentShift = contentDeltaX
        
        ShapeV5.updateSize(shiftX: contentDeltaX)
        
        ShapeV5.sortList(shiftX: contentDeltaX)
        
        Plot.update(deltaX: contentDeltaX, deltaY: contentDeltaY)
//        mapScroll.contentOffset.y = contentDeltaY / 100
        
        
//        for shape in ShapeV5.allSorted {
//            print("adding subl")
//            print("\(shape.outlineColor)....\(shape.originY)")
//        
//        }
        
        
        
        
    
    }
    

    
    func exitTap(_ sender: UITapGestureRecognizer) {
        
        let contentDeltaX = scrollView.contentOffset.x
        print("\(contentDeltaX)....exitTap...")
        let tappedMessage = sender.view as! ShapeV5
//        let tappedMessage = tappedButton?.superview as! ShapeV5
        print(tappedMessage.message.senderID)
        
        tappedMessage.makeBox()
        
        
        
        tappedMessage.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        tappedMessage.addGestureRecognizer(tap)
        
        
        
        ShapeV5.sortList(shiftX: contentDeltaX)
        
        
    }
    
    
    func handleTap(_ sender: UITapGestureRecognizer) {
    
        let tappedMessage = sender.view as! ShapeV5
        if tappedMessage.form == .bubble {
            return
        }
        
        else {
            let contentDeltaX = scrollView.contentOffset.x
            let contentDeltaY = scrollView.contentOffset.y
            
            tappedMessage.makeDetail(shiftX: contentDeltaX, shiftY: contentDeltaY, superView: view)
            
            for shape in ShapeV5.all {
                shape.isUserInteractionEnabled = false
            }
            
            tappedMessage.isUserInteractionEnabled = true

    
            let exitTap = UITapGestureRecognizer(target: self, action: #selector(self.exitTap(_:)))
            tappedMessage.addGestureRecognizer(exitTap)
            
//            for shape in ShapeV5.all {
//                shape.isUserInteractionEnabled = true
//            }
            
            
            
        }
    }
    
    
    func handleTap2(_ sender: UITapGestureRecognizer) {
        tappedShape = sender.view as! ShapeV5
        if tappedShape?.form == .bubble {
            return
        }
            
        else {
            performSegue(withIdentifier: "toDetail", sender: nil)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let destinationVC = segue.destination as? DetailViewController {
                destinationVC.detailShape = tappedShape
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
// 
//        let senders = ["eatalyflatiron", "arsenal", "deadspin", "mobute", "vice", "NYMag", "netw3rk", "coindesk"]
//        
//        
//        Modelv2.shared.getTweetShapeV5(senders: senders){responders in
//            for newMessage in responders {
//                self.contentView.addSubview(newMessage)
//            }
//        }
        
       
        
        let sortedDistMap = Modelv2.shared.mapDistances(myLocation: myLocation)

    
        Modelv2.shared.getTweetShapeV5_Tuple(senders: sortedDistMap){responders in
            for newMessage in responders {
//                print("\(newMessage.frame.origin.x).....\n....ADDING SUBVIEWS")
                
                
                
                newMessage.isUserInteractionEnabled = true
                let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap2(_:)))
                newMessage.addGestureRecognizer(tap)
                
    
                self.contentView.addSubview(newMessage)
                
                
            }
            
            ShapeV5.updateSize(shiftX: 0)
            
            ShapeV5.sortList(shiftX: 0)
            
            

            
            Modelv2.shared.plotMap{ plots in
                for plot in plots {
                    print("adding plots")
                    print("\(plot.frame.origin.x)..\(plot.frame.origin.y)")
                    self.map.addSubview(plot)
                }
                
            }
            
        }

        

        
        
        
        
        
        
    }
    
    
}



