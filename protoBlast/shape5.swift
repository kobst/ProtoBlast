//
//  shape5.swift
//  protoBlast
//
//  Created by Edward Han on 12/21/16.
//  Copyright © 2016 Edward Han. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation




class Message {
    static var all = [Message]()
    
    
    var formBubble: Bubble?
    var formBox: Square?
    
    
    
    var message: String
    var senderID: String
    var idImage: UIImage
    var dist: Double
    var time: Double
    
    init (message: String, senderName: String, idImage: UIImage, dist: Double, time: Double) {
        self.message = message
        self.senderID = senderName
        self.idImage = idImage
        self.dist = dist
        self.time = time
        self.formBox = Square(message: self)
        self.formBubble = Bubble(message: self)
        Message.all.append(self)
    }
    
}



class Bubble: UIView {
    
    static var bubbles = [Bubble]()
    
    var idImageView = UIImageView()

    
    
    class func updateSize(shiftX: CGFloat) {
        
        for bubble in Bubble.bubbles {
            let deltaX = bubble.frame.origin.x - shiftX
            let xFactor = (deltaX / -150) + 11/3
            bubble.transform = CGAffineTransform(scaleX: xFactor, y: xFactor)
            }
            
        }
    
    
    
    
    init(message: Message) {
        
        idImageView.image = message.idImage
        
        super.init(frame: CGRect(x: message.dist, y: message.time, width: 30 , height: 30))
        
        idImageView.frame = self.frame
        layer.borderWidth = 2
        layer.borderColor = UIColor.red.cgColor
        layer.cornerRadius = layer.frame.size.width / 2
        layer.masksToBounds = true
        
        addSubview(idImageView)
        
        idImageView.translatesAutoresizingMaskIntoConstraints = false
        idImageView.clipsToBounds = true
        idImageView.center = center
        idImageView.layer.masksToBounds = true
        idImageView.contentMode = UIViewContentMode.scaleAspectFill
        
        translatesAutoresizingMaskIntoConstraints = false
        autoresizesSubviews = true
        
        
        Bubble.bubbles.append(self)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



class Square: UIView {
    
    static var squares = [Square]()
    
    
    let messageStyle = [NSFontAttributeName: UIFont(name: "Chalkduster", size: 11.0)! ]
    let idStyle = [NSFontAttributeName: UIFont(name: "Chalkduster", size: 12.0)! ]
    
    var idImageView: UIImageView
    var messageField = UITextField()
    var senderID = UILabel()
    
//    var messageID: Int
    
    init(message: Message) {
        idImageView = UIImageView(image: message.idImage)
        messageField.text = message.message
        senderID.text = message.senderID
        
        super.init(frame: CGRect(x: message.dist, y: message.time, width: 100 , height: 40))
        
        
        idImageView.frame = self.frame
        layer.borderWidth = 2
        layer.borderColor = UIColor.red.cgColor
        layer.cornerRadius = layer.frame.size.width / 8
        layer.masksToBounds = true
        
        addSubview(idImageView)
        
        idImageView.translatesAutoresizingMaskIntoConstraints = false
        idImageView.clipsToBounds = true
        idImageView.center = center
        idImageView.layer.masksToBounds = true
        idImageView.contentMode = UIViewContentMode.scaleAspectFill
        
        translatesAutoresizingMaskIntoConstraints = false
        autoresizesSubviews = true
        
        
        Square.squares.append(self)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



class ShapeV5: UIView {
    
    static var all = [ShapeV5]()
    
    class func updateSize(shiftX: CGFloat) {
        
        for shape in ShapeV5.all {
            let deltaX = shape.frame.origin.x - shiftX
            
            if deltaX < 50 {
                print("MAKING BOX \n........... \(shape.message.senderID)...... \n")
                shape.makeBox()
            }
            
            else {
                let xFactor = (deltaX / -150) + 11/3
                shape.transform = CGAffineTransform(scaleX: xFactor, y: xFactor)
            }
            

        }
        
    }
    
    
    
    func makeBox() {
        
        layer.frame = CGRect(x: layer.frame.origin.x, y: layer.frame.origin.y, width: 160, height: 70)
        
        idImageView.frame = CGRect(x: 0, y: 0, width: layer.frame.width * 0.32, height: layer.frame.height * 0.66)
        
        messageField.frame = CGRect(x: layer.frame.width * 0.32, y: 0, width: layer.frame.width * 0.68, height: layer.frame.height)
        
        senderID.frame = CGRect(x:0, y: layer.frame.height * 0.68, width: layer.frame.width * 0.32, height: layer.frame.height * 0.3)
        
        
        idImageView.layer.cornerRadius = 5
        
        
        self.addSubview(messageField)
        self.addSubview(senderID)
        
        
        
    

    }
    
    
    let messageStyle = [NSFontAttributeName: UIFont(name: "Chalkduster", size: 11.0)! ]
    let idStyle = [NSFontAttributeName: UIFont(name: "Chalkduster", size: 12.0)! ]
    
    

    
    var message: MessageData
    var idImageView = UIImageView()
    var messageField = UITextField()
    var senderID = UILabel()
  
    
    init(message: MessageData) {
        
        self.message = message
        self.idImageView.image = message.idImage
        
    
 
        let styledMessage = NSAttributedString(string: message.message, attributes: messageStyle)
        let styledID = NSAttributedString(string: message.senderID, attributes: idStyle)
        

        self.messageField.attributedText = styledMessage
        self.senderID.attributedText = styledID
        
//        self.messageField.text = message.message
//        self.senderID.text = message.senderID
        
        super.init(frame: CGRect(x: message.dist, y: message.time, width: 30 , height: 30))
        
        idImageView.frame = self.frame
        layer.borderWidth = 2
        layer.borderColor = UIColor.red.cgColor
        layer.cornerRadius = layer.frame.size.width / 2
        layer.masksToBounds = true
        
        addSubview(idImageView)
        
        idImageView.translatesAutoresizingMaskIntoConstraints = false
        idImageView.clipsToBounds = true
        idImageView.center = center
        idImageView.layer.masksToBounds = true
        idImageView.contentMode = UIViewContentMode.scaleAspectFill
        
        translatesAutoresizingMaskIntoConstraints = false
        autoresizesSubviews = true
        
        ShapeV5.all.append(self)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    class MessageData {
        static var all = [Message]()
        
        
        var message: String
        var senderID: String
        var idImage: UIImage
        var dist: Double
        var time: Double
        
        init (message: String, senderName: String, idImage: UIImage, dist: Double, time: Double) {
            self.message = message
            self.senderID = senderName
            self.idImage = idImage
            self.dist = dist
            self.time = time

        }
        
    }
    
    
    
    
    
    
    
    

    
    
}




