//
//  double-class-shape-model.swift
//  protoBlast
//
//  Created by Edward Han on 12/23/16.
//  Copyright © 2016 Edward Han. All rights reserved.
//

import Foundation
import UIKit


class Message {
    
    static var all = [Message]()
    
    enum form {
        case bubble
        case square
    }
    
    var shape: form = .bubble
    
    
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
        self.shape = .bubble
        Message.all.append(self)
    }
    
}



class Bubble: UIView {
    
    static var bubbles = [Bubble]()
    
    class func updateSize(shiftX: CGFloat) {
        for bubble in Bubble.bubbles {
            let deltaX = bubble.frame.origin.x - shiftX
            let xFactor = (deltaX / -150) + 11/3
            bubble.transform = CGAffineTransform(scaleX: xFactor, y: xFactor)
        }
    }
    
    
    var idImageView = UIImageView()
    
    init(message: Message) {
        
        idImageView.image = message.idImage
        
        super.init(frame: CGRect(x: message.dist, y: message.time, width: 30 , height: 30))
        
        idImageView.frame = self.frame
        idImageView.contentMode = .scaleAspectFit
        
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
        
        let styledMessage = NSAttributedString(string: message.message, attributes: messageStyle)
        let styledID = NSAttributedString(string: message.senderID, attributes: idStyle)
        
        messageField.attributedText = styledMessage
        senderID.attributedText = styledID
        
        
        super.init(frame: CGRect(x: message.dist, y: message.time, width: 160 , height: 70))
        
        layer.borderWidth = 2
        layer.borderColor = UIColor.red.cgColor
        layer.cornerRadius = layer.frame.size.width / 8
        layer.masksToBounds = true
        
        
        idImageView.frame = CGRect(x: 0, y: 0, width: layer.frame.width * 0.32, height: layer.frame.height * 0.66)
        
        messageField.frame = CGRect(x: layer.frame.width * 0.32, y: 0, width: layer.frame.width * 0.68, height: layer.frame.height)
        
        senderID.frame = CGRect(x:0, y: layer.frame.height * 0.68, width: layer.frame.width * 0.32, height: layer.frame.height * 0.3)
        
        
        idImageView.layer.cornerRadius = idImageView.layer.frame.size.width * 0.32
        idImageView.translatesAutoresizingMaskIntoConstraints = false
        idImageView.clipsToBounds = true
        idImageView.layer.masksToBounds = true
        idImageView.contentMode = UIViewContentMode.scaleAspectFill
        
        translatesAutoresizingMaskIntoConstraints = false
        autoresizesSubviews = true
        
        addSubview(idImageView)
        addSubview(messageField)
        addSubview(senderID)
        
        
        Square.squares.append(self)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



