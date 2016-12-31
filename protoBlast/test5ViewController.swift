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


class Test5ViewController: UIViewController, UIScrollViewDelegate, CLLocationManagerDelegate {
    
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
        
        
        
        
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //        print(scrollView.contentOffset.x)
        let contentDelta = scrollView.contentOffset.x
        
//       Bubble.updateSize(shiftX: contentDelta)
        ShapeV5.contentShift = contentDelta
        
        ShapeV5.updateSize(shiftX: contentDelta)
        
        ShapeV5.sortList(shiftX: contentDelta)
        
        
//        for shape in ShapeV5.allSorted {
//            print("adding subviews on scrolll")
//            print("\(shape.originX)....\(shape.originY)")
//            contentView.addSubview(shape)
//        }
        
        
    
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
                print("\(newMessage.frame.origin.x).....\n....ADDING SUBVIEWS")
                self.contentView.addSubview(newMessage)
            }
        }



        
        
    }
    
    
}



