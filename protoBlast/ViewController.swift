//
//  ViewController.swift
//  protoBlast
//
//  Created by Edward Han on 11/11/16.
//  Copyright © 2016 Edward Han. All rights reserved.
//

import UIKit
import CoreLocation

//
//
//class ViewController: UIViewController, CLLocationManagerDelegate, UIGestureRecognizerDelegate {
//    
//    var locationManager = CLLocationManager()
//    
//    var mylocation = CLLocationCoordinate2D(latitude: 50.0, longitude: 50.0)
//    
//    @IBOutlet weak var vectorLabel: UILabel!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        
//        view.backgroundColor = UIColor.blue
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.startUpdatingLocation()
//        
//        
//        print(test.messageField.text!)
//        print(test.senderNameField.text!)
//        
//        
//        let testBox = testShape2(message: "test", senderName: "es", idImage: #imageLiteral(resourceName: "Image-1"), time: 65.0, dist: 30.8)
////        let testBox = ShapeV2(message: "test", senderName: "idname", idImage: #imageLiteral(resourceName: "Image"), xx: 50, yy: 200)
//        
//    
//        view.addSubview(testBox)
//        testBox.backgroundColor = UIColor.red
//        
//        testBox.translatesAutoresizingMaskIntoConstraints = false
//        view.translatesAutoresizingMaskIntoConstraints = false
//        
////        
//        let widthConstraint = NSLayoutConstraint(item: testBox, attribute: .width, relatedBy: .equal, toItem: view, attribute:.width, multiplier: 0.65, constant:0.0)
////
//        let squareConstraint = NSLayoutConstraint(item: testBox, attribute: .height, relatedBy: .equal, toItem: testBox, attribute:.width, multiplier: 1.0, constant:0.0)
//
//        let xConstraint = NSLayoutConstraint(item: testBox, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0)
//
//        let yConstraint = NSLayoutConstraint(item: testBox, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 0.75, constant: 0)
//        
//        
//        NSLayoutConstraint.activate([widthConstraint, squareConstraint, xConstraint, yConstraint])
//        view.addConstraints([widthConstraint, squareConstraint, xConstraint, yConstraint])
//        
//   
//        
//        
        
        
        
        
//        
//        for msg in messageA {
////            let frame = CGRect()
////            let width = CGFloat((msg.dist) * 0.01 * Double(UIScreen.main.bounds.width))
////            let height = width
////            
////            let xPos = UIScreen.main.bounds.width -
////            
//            
//            let sizeX = CGFloat(msg.dist * 0.01)
//            let xPos = CGFloat(1.0)
//            let yPos = CGFloat(1.0) + CGFloat(msg.time * 0.01)
//            print(sizeX, xPos, yPos)
//        
//            view.addSubview(msg)
//            
//            msg.translatesAutoresizingMaskIntoConstraints = false
//            view.translatesAutoresizingMaskIntoConstraints = false
//            
//            let widthConstraint = NSLayoutConstraint(item: msg, attribute: .width, relatedBy: .equal, toItem: view, attribute:.width, multiplier: sizeX, constant:0.0)
//            
//            let squareConstraint = NSLayoutConstraint(item: msg, attribute: .width, relatedBy: .equal, toItem: msg, attribute:.height, multiplier: 1.0, constant:0.0)
//            
//            let xConstraint = NSLayoutConstraint(item: msg, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: xPos , constant: 0.0)
//            
//            let yConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: yPos, constant: 0)
//            
//            
//            NSLayoutConstraint.activate([widthConstraint, squareConstraint, xConstraint, yConstraint])
//            view.addConstraints([widthConstraint, squareConstraint, xConstraint, yConstraint])
//            
//            
//            
//            
//            
//        }
//        
        
        
        
        
//        for msg in messages {

//            let sizeX = (-1/35)*(msg.dist) + 0.189
//            var sizeFactor = CGFloat()
//            
//            if sizeX < 0.075 {
//                sizeFactor = 0.075
//            }
//            
//            if sizeX > 0.175 {
//                sizeFactor = 0.175
//            }
//            else {sizeFactor = CGFloat(sizeX)}
//            
//            
//            let xPosFactor = CGFloat(2.0 - sizeX)
//            let yPosFactor = CGFloat(msg.time)
//            
//            print(xPosFactor)
//            print(msg.dist)
            
            
//            
//            view.addSubview(msg)
            
//            msg.translatesAutoresizingMaskIntoConstraints = false
//            view.translatesAutoresizingMaskIntoConstraints = false
            
//            let widthConstraint = NSLayoutConstraint(item: msg, attribute: .width, relatedBy: .equal, toItem: view, attribute:.width, multiplier: sizeFactor, constant:0.0)
//            
//            let squareConstraint = NSLayoutConstraint(item: msg, attribute: .height, relatedBy: .equal, toItem: msg, attribute:.height, multiplier: 1.0, constant:0.0)
//            
//            let xConstraint = NSLayoutConstraint(item: msg, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: xPosFactor, constant: 0.0)
//            
//            let yConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: yPosFactor, constant: 0)
//            
//            
//            NSLayoutConstraint.activate([widthConstraint, squareConstraint, xConstraint, yConstraint])
            
            
            
//            NSLayoutConstraint(item: msg, attribute: .width, relatedBy: .equal, toItem: view, attribute:.width, multiplier: sizeFactor, constant:0.0).isActive = true
//            
//            NSLayoutConstraint(item: msg, attribute: .height, relatedBy: .equal, toItem: msg, attribute:.height, multiplier: 1.0, constant:0.0).isActive = true
//            
//            NSLayoutConstraint(item: msg, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: xPosFactor, constant: 0.0).isActive = true
//            
//            NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
//            
//            
    
//        }
//        
//    
//        
//
//        let sliderPGR = UIPanGestureRecognizer(target: self, action: #selector(ViewController.gestureHandler(sender:)))
//        sliderPGR.delegate = self
//        view.addGestureRecognizer(sliderPGR)
//        
//        
//    }
//    
//    
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//    
//    
//    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        
//        let userLocation: CLLocation = locations[0]
//        
//        let latitude = userLocation.coordinate.latitude
//        
//        let longitude = userLocation.coordinate.longitude
//        
//        mylocation = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
//        
//    }
//    
//    
//
//    
//    
//    func gestureHandler(sender: UIPanGestureRecognizer) {
//        
//        let panVectorⓖ² = sender.translation(in: view)
//        
//        vectorLabel.text = String(describing: panVectorⓖ²)
//        
//        let xMove = panVectorⓖ².x
//        
//        let yMove = panVectorⓖ².y
//        
//        
//        
//        
//        
//    }
//
//
//
//}






