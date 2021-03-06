//
//  data.swift
//  protoBlast
//
//  Created by Edward Han on 11/11/16.
//  Copyright © 2016 Edward Han. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation


public class TwitterServiceWrapper:NSObject {
    let consumerKey = "eSaPtWkPEBS0KZOxRCDAQWfMU"
    let consumerSecret = "xxt97EAmwhgQ06V7yKm9w7kqHhRxQXKrUhm4AvtfVrrhfWAQif"
    let authURL = "https://api.twitter.com/oauth2/token"
}




//let swifter = Swifter(consumerKey: "eSaPtWkPEBS0KZOxRCDAQWfMU", consumerSecret: "xxt97EAmwhgQ06V7yKm9w7kqHhRxQXKrUhm4AvtfVrrhfWAQif")




class StackShape: UIView{
    var backImage: UIImage
    var idImage: UIImage
//    var frame: CGRect
    init(_ backImage: UIImage, _ idImage: UIImage, _ frame: CGRect) {
        self.backImage = backImage
        self.idImage = idImage
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}





class blastMessage {
    var quote: String
    var senderID: String
    var stacked: StackShape
//    var stacked = StackShape(<#T##backImage: UIImage##UIImage#>, <#T##idImage: UIImage##UIImage#>, <#T##frame: CGRect##CGRect#>)
    init(_ quote: String, _ senderID: String, _ stacked: StackShape) {
        
        self.quote = quote
        self.senderID = senderID
        self.stacked = stacked
        
    }
    
}


//func makeMessage(mes: String, id: String, xx: Int, yy: Int) -> StackedShape {
//    let box = CGRect(x: xx, y: yy, width: 100, height: 100)
////    let message = StackedShape(message: mes, senderName: id, backgroundImage: #imageLiteral(resourceName: "Image-1"), idImage: #imageLiteral(resourceName: "Image"), frame: box)
//    
//    let message = StackedShape(message: mes, senderName: id, idImage: #imageLiteral(resourceName: "Image"), frame: box)
//    return message
//}




func fetchData(closure: @escaping (String) -> ()) {
    let terms = ""
    let encodedText = terms.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    let endpoint = String(format: "ttps://api.twitter.com/1.1/statuses/user_timeline.json", encodedText);
    let url = URLRequest(url: URL(string: endpoint)!)
    let session = URLSession(configuration: URLSessionConfiguration.default)
    let task = session.dataTask(with: url) { (data, response, error) in
        // TODO: add error handling
        guard let responseData = data else {
            //                self.textView.text = "Error: did not receive data"
            return
        }
        DispatchQueue.main.async {
            closure(String(data: responseData, encoding: String.Encoding.utf8)!)
        }
    }
    task.resume()
}



// @40.7369392,-73.9918239  40.742164,-73.992088
var messageList: [blastMessage] = []



let testShape = StackedShape(message: "test", senderName: "idname", idImage: #imageLiteral(resourceName: "Image"), xx: 50, yy: 200)
let testShape2 = StackedShape(message: "test", senderName: "idname", idImage: #imageLiteral(resourceName: "Image"), xx: 90, yy: 20)
let testShape3 = StackedShape(message: "test", senderName: "idname", idImage: #imageLiteral(resourceName: "Image"), xx: 150, yy: 110)



var messages = [testShape, testShape2, testShape3]






var coordinates: [String: CLLocationCoordinate2D] = [
"UnionSqBarnesNoble": CLLocationCoordinate2D(latitude: 40.7369392, longitude: -73.9918239),
"EatalyNYC": CLLocationCoordinate2D(latitude: 40.742164, longitude: 73.992088)
    

]



