//
//  Model.swift
//  protoBlast
//
//  Created by Edward Han on 12/17/16.
//  Copyright © 2016 Edward Han. All rights reserved.
//

import Foundation
import TwitterKit
import UIKit


class Model {
    static let shared = Model()
    private init(){}
    
    
    
    func getTweetMessage(sender: String) {
        
        let client = TWTRAPIClient()
        let statusesShowEndpoint = "https://api.twitter.com/1.1/statuses/user_timeline.json"
        let params: [AnyHashable : Any] = [
            "screen_name": sender,
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
                            let randDist = CGFloat(arc4random()%350)
                            let randTime = CGFloat(arc4random()%350)
                            let shape = ShapeV3.spawnBox(message: messageText, senderName: "Eataly", idImage: image!, dist: randDist, time: randTime)
                        }
                        }.resume()
                }
                
            } catch let jsonError as NSError {print("json error: \(jsonError.localizedDescription)")}
            
        }
    
    }

    
    
    
    //------------
    
    
    func getTweetMessageV2(sender: String) {
        
        let client = TWTRAPIClient()
        let statusesShowEndpoint = "https://api.twitter.com/1.1/statuses/user_timeline.json"
        let params: [AnyHashable : Any] = [
            "screen_name": sender,
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
                        let randDist = CGFloat(arc4random()%350)
                        let randTime = CGFloat(arc4random()%350)
                        let shape = ShapeV3.spawnBox(message: messageText, senderName: "Eataly", idImage: image!, dist: randDist, time: randTime)
                        print("\(shape.messageField.text) .......................\(shape.dist)......")
                        }.resume()
                }
            } catch let jsonError as NSError {print("json error: \(jsonError.localizedDescription)")}
            
        }
        
    }
    
    
    

    
    func getTweetMessageV3(senders: [String], closure: @escaping([ShapeV3]) -> ()) {
        
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
                    let userDict = tweetDict["user"] as! [String: Any]
                    let photoID = userDict["profile_image_url"] as! String
                    let messageText = tweetDict["text"] as! String
                    
                    DispatchQueue.global(qos: .utility).async {
                        let photoURL = URL(string: photoID)!
                        URLSession.shared.dataTask(with: photoURL) { (data, _, _) in
                            guard let responseData = data else { return }
                            let image = UIImage(data: responseData)
                            print("got data")
                            let randDist = CGFloat(arc4random()%350)
                            let randTime = CGFloat(arc4random()%350)
                            let shape = ShapeV3.spawnBox(message: messageText, senderName: "Eataly", idImage: image!, dist: randDist, time: randTime)
                            print("\(shape.messageField.text) .......................\(shape.dist)......")
                            DispatchQueue.main.async {
                                dG.leave()
                            }
                            }.resume()
                    }
                } catch let jsonError as NSError {print("json error: \(jsonError.localizedDescription)")}
                
            }
            
            
            dG.notify(queue: .main){
                print("----------------------------------DONE DONE DONE")
                closure(ShapeV3.shapes)
            }
            
        }
    
            
        }


    

    
    func getTweetMessageV4(senders: [String], closure: @escaping([ShapeV3]) -> ()) {
        
        let dG = DispatchGroup()
        
        
        for sender in senders {
//            var photoURL: URL
//            var shape: ShapeV3
            
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
                    let userDict = tweetDict["user"] as! [String: Any]
                    let photoID = userDict["profile_image_url"] as! String
                    let messageText = tweetDict["text"] as! String
                    let photoURL = URL(string: photoID)!
                    let randDist = CGFloat(arc4random()%350)
                    let randTime = CGFloat(arc4random()%350)
                    let shape = ShapeV3.spawnBox(message: messageText, senderName: "Eataly", idImage: #imageLiteral(resourceName: "Image"), dist: randDist, time: randTime)
                    print("\(shape.messageField.text) .......................\(shape.dist)......")
                    dG.leave()
                    
                    DispatchQueue.global(qos: .utility).async {
//                        sleep(5)
                        URLSession.shared.dataTask(with: photoURL) { (data, _, _) in
                            guard let responseData = data else { return }
                            let image = UIImage(data: responseData)
                            print("got image")
                            DispatchQueue.main.async {
                                shape.idImageView.image = image
                            }}.resume()
                    }
                } catch let jsonError as NSError {print("json error: \(jsonError.localizedDescription)")}
                
  

            
            
            dG.notify(queue: .main){
                print("----------------------------------DONE DONE DONE")
                closure(ShapeV3.shapes)
            }
            
        }
        
        
    }


    
    
    
    
    
    
    
    
    
    }
    
    
    
    
    
    
}