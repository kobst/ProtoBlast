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
                    
//                    let photoID = userDict["profile_image_url"] as! String
                    
                    let photoID = userDict["profile_image_url_https"] as! String
                    
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
    
    
    
    
    
    let coordinates: [String: CLLocation] = [
        "strandbookstore": CLLocation(latitude: 40.7332583, longitude: -73.9907914),
        "eatalyflatiron": CLLocation(latitude: 40.742164, longitude: -73.992088),
        "UnionSquareNY": CLLocation(latitude: 40.7362512, longitude: -73.9946859),
        "MadSqParkNYC": CLLocation(latitude: 40.7420411, longitude: -73.9897575),
        "TimesSquareNYC": CLLocation(latitude: 40.758899, longitude: -73.987325),
        "sunshine_cinema": CLLocation(latitude: 40.7231256, longitude: -73.9921055),
        "IrvingPlaza" : CLLocation(latitude: 40.734933, longitude: -73.990642),
        "unionfarenyc": CLLocation(latitude: 40.737899, longitude: -73.993489),
        "highlinenyc" : CLLocation(latitude: 40.7479965, longitude: -74.0069589),
        "WSPConservancy": CLLocation(latitude: 40.7308228,longitude: -73.997332),
        "RubinMuseum": CLLocation(latitude: 40.732294, longitude: -73.9998917),
        "flightclub": CLLocation(latitude: 40.7324626, longitude: -73.999618),
        "WebsterHall" : CLLocation(latitude: 40.7324626, longitude: -73.999618),
        "vanguardjazz": CLLocation(latitude: 40.7324626, longitude: -73.999618),
        "MorganLibrary": CLLocation(latitude: 40.7489914, longitude: -73.9949119),
        "TheGarden": CLLocation(latitude: 40.7505085, longitude: -73.9956327),
        "GothamComedy": CLLocation(latitude: 40.7443792, longitude: -73.9964206),
        "burger_lobster": CLLocation(latitude: 40.7399067, longitude: -73.9942959),
        "OttoPizzeria": CLLocation(latitude: 40.7321577, longitude: -73.9987826),
        "lprnyc": CLLocation(latitude: 40.7254847, longitude: -74.0078584),
        "MightyQuinnsBBQ": CLLocation(latitude: 40.7270126, longitude: -73.9851812),
        "BaohausNYC": CLLocation(latitude: 40.734478, longitude: -73.9880487),
        "thespottedpig": CLLocation(latitude: 40.7316653, longitude: -74.0085412),
        "thebeannyc": CLLocation(latitude: 40.7246695, longitude: -73.9901214),
        "UnleashedPetco": CLLocation(latitude: 40.716145, longitude: -74.012408),
        "MercuryLoungeNY": CLLocation(latitude: 40.7451645,longitude: -73.9803567),
        "FriedmansNYC": CLLocation(latitude: 40.7451998, longitude: -73.995726),
        "Tekserve": CLLocation(latitude: 40.7434809, longitude: -73.995594),
        "Almond_NYC": CLLocation(latitude: 40.740085, longitude: -73.9909449),
        "BarnJoo": CLLocation(latitude: 40.7388458, longitude: -73.9922692),
        "milkbarstore": CLLocation(latitude: 40.7319039, longitude: -73.9879422),
        "BNUnionSquareNY": CLLocation(latitude: 40.7369432, longitude: -73.9918239)
    ]
    
    
        
        
        
        
    }
    
    
    

    
    
