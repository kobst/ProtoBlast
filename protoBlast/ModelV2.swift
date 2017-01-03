//
//  ModelV2.swift
//  protoBlast
//
//  Created by Edward Han on 12/28/16.
//  Copyright © 2016 Edward Han. All rights reserved.
//

import Foundation
import TwitterKit
import UIKit
import CoreLocation


class Modelv2{
    static let shared = Modelv2()
    private init(){}
    
    var dateFormatter = DateFormatter()
    
    
    
    func mapDistances(myLocation: CLLocation) -> [(String, Double)] {
        
        var distMap: [(sender: String, dist: Double)] = []
        
        for (key, value) in coordinates {
            let location = key
            let dist = myLocation.distance(from: value)
            let roundedDist = Double(round(dist)/1000)
            let newDistMapTuple = (location, roundedDist)
            distMap.append(newDistMapTuple)
        }
        
        let sortedDistMap = distMap.sorted(by: {$0.dist < $1.dist})
        
        return sortedDistMap
        
    }
    
    
    func getTweetShapeV5(senders: [String], closure: @escaping([ShapeV5]) -> ()) {
        
        dateFormatter.dateFormat = "EEE MM dd HH:mm:ss Z yyyy"
        let now  = Date()
        
        let dG = DispatchGroup()
        
        for sender in senders {
            let client = TWTRAPIClient()
            let statusesShowEndpoint = "https://api.twitter.com/1.1/statuses/user_timeline.json"
            let params: [AnyHashable : Any] = [
                "screen_name": sender,
                "count": "1"
            ]
            
            var clientError : NSError?
            
            let request = client.urlRequest(withMethod: "GET", url: statusesShowEndpoint, parameters: params, error: &clientError)
            
            dG.enter()
            
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
                    
                    let timeString = tweetDict["created_at"] as! String
                    let timeData = self.dateFormatter.date(from: timeString)
                    
                    let timeElapsed = now.timeIntervalSince(timeData!)
                    let roundedTime = Double(round(timeElapsed*100)/100)
                    print(roundedTime)
                    
                    let userDict = tweetDict["user"] as! [String: Any]
                    
                    
                    
                    let photoID = userDict["profile_image_url"] as! String
                    let messageText = tweetDict["text"] as! String
                    let photoURL = URL(string: photoID)!
                    let randDist = CGFloat(arc4random()%3)
                    let randTime = CGFloat(arc4random()%350)
                    
                    
                    let fetchedData = ShapeV5.MessageData(message: messageText, senderName: sender, idImage: #imageLiteral(resourceName: "Image"), dist: Double(randDist), time: Double(randTime))
                    let fetchedShape = ShapeV5(message: fetchedData)
                    
                    
                    dG.leave()
                    
                    DispatchQueue.global(qos: .utility).async {
                        //                        sleep(5)
                        URLSession.shared.dataTask(with: photoURL) { (data, _, _) in
                            guard let responseData = data else { return }
                            let image = UIImage(data: responseData)
                            DispatchQueue.main.async {
                                fetchedData.idImage = image!
                                fetchedShape.idImageView.image = image!
                            }}.resume()
                    }
                } catch let jsonError as NSError {print("json error: \(jsonError.localizedDescription)")}
                
                
                
                dG.notify(queue: .main){
                    print("DONE DONE ---------------------------")
                    closure(ShapeV5.all)
                }
                
            }
            
            
        }
        
        
        
    }
    
    
    
    func getTweetShapeV5_Tuple(senders: [(String, Double)], closure: @escaping([ShapeV5]) -> ()) {
        
        dateFormatter.dateFormat = "EEE MM dd HH:mm:ss Z yyyy"
        let now  = Date()
        
        let dG = DispatchGroup()
        
     
        for sender in senders {
            let client = TWTRAPIClient()
            let statusesShowEndpoint = "https://api.twitter.com/1.1/statuses/user_timeline.json"
            let params: [AnyHashable : Any] = [
                "screen_name": sender.0,
                "count": "1"
            ]
            
            var clientError : NSError?
            let request = client.urlRequest(withMethod: "GET", url: statusesShowEndpoint, parameters: params, error: &clientError)
            
            dG.enter()
            
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
                    
                    let timeString = tweetDict["created_at"] as! String
                    let timeData = self.dateFormatter.date(from: timeString)
                    
                    let timeElapsed = now.timeIntervalSince(timeData!)
                    let roundedTime = Double(round(timeElapsed*100)/100)
                    
                    
                    let userDict = tweetDict["user"] as! [String: Any]
                    
                    let photoID = userDict["profile_image_url"] as! String
                    let messageText = tweetDict["text"] as! String

                    let photoURL = URL(string: photoID)!
//                                        let randDist = CGFloat(arc4random()%350)
//                    let randTime = CGFloat(arc4random()%350)
                    //                    let dist = sender.1
                    
                    
                    
                    let fetchedData = ShapeV5.MessageData(message: messageText, senderName: sender.0, idImage: #imageLiteral(resourceName: "Image"), dist: sender.1, time: roundedTime)
                    
                    
                    let fetchedShape = ShapeV5(message: fetchedData)
                    

                    print("made shape from tuple....\(fetchedData.message)")
                    
                    dG.leave()
                    
                    DispatchQueue.global(qos: .utility).async {
                        //                        sleep(5)
                        URLSession.shared.dataTask(with: photoURL) { (data, _, _) in
                            guard let responseData = data else { return }
                            let image = UIImage(data: responseData)
                            DispatchQueue.main.async {
                                fetchedData.idImage = image!
                                fetchedShape.idImageView.image = image!
                            }}.resume()
                    }
                } catch let jsonError as NSError {print("json error: \(jsonError.localizedDescription)")}
                
                
                dG.notify(queue: .main){    //  HOW TO send shapeV5.all even if all dg has not left, but a time has elapsed
                    print("done------ main queue")
                    closure(ShapeV5.all)
                }
                
            }
            
        }
        
    }
    
    
    

    
//    func plotMap() -> [Plot] {
//        var plots = [Plot]()
//        for shape in ShapeV5.allSorted {
//            let rawY = shape.frame.origin.y
//            let rawX = shape.frame.origin.x
//            let plotY = rawY / 5
//            let plotX = rawX / 5
//            let mapPlot = Plot(x: plotX, y: plotY)
//            plots.append(mapPlot)
//        }
//        return plots        
//    }
    
    
    
    
    
    func plotMap(closure: @escaping ([Plot]) -> ()) {
        var plots = [Plot]()
        for shape in ShapeV5.allSorted {
            let rawY = shape.frame.origin.y
            let rawX = shape.frame.origin.x
            let plotY = rawY / 10
            let plotX = rawX / 5
            let mapPlot = Plot(x: plotX, y: plotY)
            plots.append(mapPlot)
        }
       closure(plots)
    }
    
    
    
    
        
        
        
        
    }
    
    
    

    
    
