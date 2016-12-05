//
//  ViewController.swift
//  protoBlast
//
//  Created by Edward Han on 11/11/16.
//  Copyright © 2016 Edward Han. All rights reserved.
//

import UIKit
import CoreLocation



class ViewController: UIViewController, CLLocationManagerDelegate, UIGestureRecognizerDelegate {
    
    var locationManager = CLLocationManager()
    
    var location = CLLocationCoordinate2D(latitude: 50.0, longitude: 50.0)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor.blue
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
//        let testShape = StackedShape(message: "testesttest", senderName: "id", idImage: image, xx: 50, yy: 200)
//        let testShape2 = StackedShape(message: "testesttest", senderName: "id", xx: 120, yy: 20)
//        let testShape3 = StackedShape(message: "testesttest", senderName: "id", xx: 160, yy: 100)
        

        for msg in messages {
            view.addSubview(msg)
        }
        

        var sliderPGR = UIPanGestureRecognizer(target: self, action: #selector(ViewController.exampleGestureHandler(sender:)))
        sliderPGR.delegate = self
        view.addGestureRecognizer(sliderPGR)
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation: CLLocation = locations[0]
        
        let latitude = userLocation.coordinate.latitude
        
        let longitude = userLocation.coordinate.longitude
        
        location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
    }
    
    
    
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
    
    
    func exampleGestureHandler(sender: UIPanGestureRecognizer) {
        
    }
}

    
    
    
    
    


