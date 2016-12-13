//
//  testView.swift
//  Pods
//
//  Created by Edward Han on 12/7/16.
//
//

import UIKit
import CoreLocation


import TwitterKit


class testViewController: UIViewController, UIGestureRecognizerDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var vectorLabel: UILabel!
    
    @IBOutlet weak var messageReader: UILabel!
    
    
    var locationManager = CLLocationManager()
    var mylocation = CLLocationCoordinate2D(latitude: 50.0, longitude: 50.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.blue
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        


//this works....
        
//        
//        let client = TWTRAPIClient()
//        client.loadTweet(withID: "20") { tweet, error in
//            if let t = tweet {
//                self.messageReader.text = t.text
//            } else {
//                print("Failed to load Tweet: \(error?.localizedDescription)")
//            }
//        }
        

//        let client = TWTRAPIClient()
//        let dataSource = TWTRUserTimelineDataSource(screenName: "EatalyFlatiron", apiClient: client)
        
   
    
        
        
        // for a user timeline with para "id" doesn't work...
        
//        let statusesShowEndpoint = "https://api.twitter.com/1.1/statuses/user_timeline.json"
//        params = ["id_"]
        
        
        
        // this works... gets me back a json with all info on the tweet
        
        let client = TWTRAPIClient()
        let statusesShowEndpoint = "https://api.twitter.com/1.1/statuses/show.json"
        let params = ["id": "20"]
        var clientError : NSError?
        
        let request = client.urlRequest(withMethod: "GET", url: statusesShowEndpoint, parameters: params, error: &clientError)
        
        client.sendTwitterRequest(request) { (response, data, connectionError) -> Void in
            if connectionError != nil {
                print("Error: \(connectionError)")
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print("json: \(json)")
            } catch let jsonError as NSError {
                print("json error: \(jsonError.localizedDescription)")
            }
        }
        
        
        
        
        
        
       
        ShapeV2.spawnBox(message: "test", senderName: "me", idImage: #imageLiteral(resourceName: "Image"), dist: 1.1, time: 2.0, containingView: view)
        
        ShapeV2.spawnBox(message: "test", senderName: "me", idImage: #imageLiteral(resourceName: "Image"), dist: 1.9, time: 5.0, containingView: view)
        
        ShapeV2.spawnBox(message: "test", senderName: "me", idImage: #imageLiteral(resourceName: "Image"), dist: 0.4, time: 3.0, containingView: view)
        
        
        
        let sliderPGR = UIPanGestureRecognizer(target: self, action: #selector(testViewController.gestureHandler(sender:)))
        sliderPGR.delegate = self
        view.addGestureRecognizer(sliderPGR)
      
    }

    
    
    func gestureHandler(sender: UIPanGestureRecognizer) {
    
        let panToDistRatio: CGFloat = 0.01
        let panVectorⓖ² = sender.translation(in: view)
        let xMove = panVectorⓖ².x
//        let yMove = panVectorⓖ².y
      

        let distChange = xMove * panToDistRatio
        
//        ShapeV2.updateConstraints(xDelta: distChange, super)
        ShapeV2.updateConstraints(xDelta: distChange, superV: view)
        vectorLabel.text = String("\(panVectorⓖ².x)" + "     \(distChange)")
        
        }
    
    
    override func viewDidAppear(_ animated: Bool) {
        ShapeV2.setCornerRadius()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
