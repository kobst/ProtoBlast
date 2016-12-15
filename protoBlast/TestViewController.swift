//
//  TestViewController.swift
//  Pods
//
//  Created by Edward Han on 12/7/16.
//
//


/*
 LAB TEST:
 
 Create a new ViewController that fetches an image with a regular URLRequest task (with another API!!) and spawns a box at viewDidAppear()
 
 
 
 */

import UIKit
import CoreLocation


import TwitterKit


class TestViewController: UIViewController, UIGestureRecognizerDelegate, CLLocationManagerDelegate {
    
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
        
        // MARK: get the tweets...
        
//        let client = TWTRAPIClient()
//        let statusesShowEndpoint = "https://api.twitter.com/1.1/statuses/user_timeline.json"
//        let params: [AnyHashable : Any] = [
//            "screen_name": "eatalyflatiron",
//            "count": "1"
//        ]
//        
//        var clientError : NSError?
//        
//        let request = client.urlRequest(withMethod: "GET", url: statusesShowEndpoint, parameters: params, error: &clientError)
//        
//        client.sendTwitterRequest(request) { (response, data, connectionError) in
//            if connectionError != nil {
//                print("Error: \(connectionError)")
//            }
//            guard let goodData = data else {
//                print("no data")
//                return}
//            do {
//                let json = try JSONSerialization.jsonObject(with: goodData, options: .mutableContainers) as! [Any]
//                
//                let tweetDict = json[0] as! [String: Any]
//                let userDict = tweetDict["user"] as! [String: Any]
//                let photoID = userDict["profile_image_url"] as! String
//                let messageText = tweetDict["text"] as! String
//                
//                DispatchQueue.global(qos: .background).async {
//                    let photoURL = URL(string: photoID)!
//                    URLSession.shared.dataTask(with: photoURL) { (data, _, _) in
//                        guard let responseData = data else {return}
//                        let image = UIImage(data: responseData)
//                        print("got data")
//                        DispatchQueue.main.async {
//                            ShapeV2.spawnBox(message: messageText, senderName: "Eataly", idImage: image!, dist: 1.1, time: 2.0, containingView: self.view, setCornerRadius: true)
//                            
//                        }
//                    }.resume()
//                }
//                
//                
//                
//                
//            } catch let jsonError as NSError {print("json error: \(jsonError.localizedDescription)")}
//
//        }
//        
        
        let sliderPGR = UIPanGestureRecognizer(target: self, action: #selector(gestureHandler(sender:)))
        sliderPGR.delegate = self
        view.addGestureRecognizer(sliderPGR)
        
        
//        ShapeV2.spawnBox(message: "messageText", senderName: "Eataly", idImage: #imageLiteral(resourceName: "Image"), dist: 1.9, time: 4.0, containingView: view)
        
    }
    
    
    
    
    @IBAction func setCornerRadius(_ sender: Any) {
        ShapeV2.setCornerRadius()
    }
    
    
    
    
    func gestureHandler(sender: UIPanGestureRecognizer) {
        
        let panToDistRatio: CGFloat = 0.01
        let panVectorⓖ² = sender.translation(in: view)
        let xMove = panVectorⓖ².x
        
        
        let distChange = xMove * panToDistRatio
        
        ShapeV2.updateConstraints(xDelta: distChange, superV: view)
        vectorLabel.text = String("\(panVectorⓖ².x)" + "     \(distChange)")
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        
        let spinner = UIActivityIndicatorView()
        spinner.activityIndicatorViewStyle = .whiteLarge
        spinner.frame = CGRect(x: view.frame.width / 2 - 100, y: view.frame.height / 2 - 100, width: 200, height: 200)
        view.addSubview(spinner)
        spinner.startAnimating()
        
        
        let client = TWTRAPIClient()
        let statusesShowEndpoint = "https://api.twitter.com/1.1/statuses/user_timeline.json"
        let params: [AnyHashable : Any] = [
            "screen_name": "eatalyflatiron",
            "count": "1"
        ]
        
        var clientError : NSError?
        

        
        let request = client.urlRequest(withMethod: "GET", url: statusesShowEndpoint, parameters: params, error: &clientError)
        
        client.sendTwitterRequest(request) { (response, data, connectionError) in
            if connectionError != nil {
                print("Error: \(connectionError)")
            }
            guard let goodData = data else {
                print("no data")
                return}
            do {
                let json = try JSONSerialization.jsonObject(with: goodData, options: .mutableContainers) as! [Any]
                
                let tweetDict = json[0] as! [String: Any]
                let userDict = tweetDict["user"] as! [String: Any]
                let photoID = userDict["profile_image_url"] as! String
                let messageText = tweetDict["text"] as! String
                
                DispatchQueue.global(qos: .background).async {
                    let photoURL = URL(string: photoID)!
                    URLSession.shared.dataTask(with: photoURL) { (data, _, _) in
                        guard let responseData = data else { return }
                        let image = UIImage(data: responseData)
                        print("got data")
                        DispatchQueue.main.async {
                            ShapeV2.spawnBox(message: messageText, senderName: "Eataly", idImage: image!, dist: 1.1, time: 2.0, containingView: self.view, setCornerRadius: false)
//                            self.view.setNeedsLayout()
                            ShapeV2.setCornerRadius()
                            print("VDA: superView: \(self.view.frame)")
                            spinner.stopAnimating()
                            self.view.setNeedsLayout()
                            
                        }
                    }.resume()
                }
                
            } catch let jsonError as NSError {print("json error: \(jsonError.localizedDescription)")}
            
        }
        
        print("\n\n*************  View did fucking appear!  *************")
        ShapeV2.setCornerRadius()
        print("VDA: \(ShapeV2.shapes.last?.frame, ShapeV2.shapes.last?.layer.cornerRadius)\n\n")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
