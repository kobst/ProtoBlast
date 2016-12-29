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


class ShapeV5: UIView {
    
    enum Form {
        case bubble
        case box
    }
    
    static var contentShift: CGFloat = 0
    
    static var all = [ShapeV5]()
    
    static var allSorted: [ShapeV5] {
        return all.sorted(by: {$0.message.time < $1.message.time})
    }
    
    static var distSorted: [ShapeV5] {
        return all.sorted(by: {$0.message.dist < $1.message.dist})
    }
    
    static var boxesSorted: [ShapeV5] {
        return allSorted.filter{$0.form == .box}
    }
    
    static var boxIndex: [Int] {
        var index = [Int]()
        for box in ShapeV5.boxesSorted {
            index.append(box.pos)
        }
        return index
    }
    
    
    
    static var inScreen: [ShapeV5] {
        var inScreen = [ShapeV5]()
        for box in allSorted {
            let dist = CGFloat(box.frame.origin.x)
            if (dist - ShapeV5.contentShift < 400) && (dist - ShapeV5.contentShift > -10) {
                        inScreen.append(box)
            }
        }
        return inScreen
    }
    

    
    
    
    // different approaches to sorting list...
    // start at top, go through list sorted (or just those in screen - eg allsorted on screen eg with dist-shiftX < screenwidth) and position in sequential order - for bubble add 5p, for box add boxheight....
    // just let the
    //
    
    //                if box.frame.origin.y < listY {
    //                    shiftDown = listY - box.frame.origin.y
    //                    box.frame.origin.y += shiftDown
    //                }
    //                else {
    //                    shiftDown = 0
    //                }
    //                listY = box.frame.size.height + box.frame.origin.y + buffer
    //            }
    //            else {
    //                box.frame.origin.y += shiftDown
    //
    //            }
    //          }
    
    
    
    
    class func sortList(shiftX: CGFloat) {
        let buffer = CGFloat(5)
        var listLB = CGFloat(0)
        var delta = CGFloat(0)
        for box in ShapeV5.inScreen {
            if box.form == .box {
                box.frame.origin.x = shiftX
                if box.originY < listLB {
                    delta = listLB - box.originY
                    box.frame.origin.y = listLB
                }
                else{
                    box.frame.origin.y = box.originY
                }
                listLB = box.frame.size.height + box.frame.origin.y + buffer
            }
            if box.form == .bubble {
                box.frame.origin.y = box.originY + delta
            }
            
        }
        
        
        
        
        
    }

    
    // just turns them into squares...
    
    //        for box in ShapeV5.boxesSorted {
    //            box.frame.origin.x = shiftX
    //            if box.frame.origin.y < listY {
    //                box.frame.origin.y = listY
    //            }
    //            listY = box.frame.size.height + box.frame.origin.y + buffer
    //        }
    
    // puts them in ordered list. bunch the bubbles together, stack the list..
    //        for box in ShapeV5.inScreen {
    //            if box.form == .box {
    //                box.frame.origin.x = shiftX
    //                if box.frame.origin.y < listLB {
    //                    box.frame.origin.y = listLB
    //                }
    //                listLB = box.frame.size.height + box.frame.origin.y + buffer
    //            }
    //            if box.form == .bubble {
    //                box.frame.origin.y = listLB
    //                listLB = box.frame.origin.y + buffer
    //            }
    //        }
    
    
    
    
    
        
    
 
    class func updateSize(shiftX: CGFloat) {
        
        for shape in ShapeV5.all {
            let deltaX = CGFloat(shape.originX) - shiftX
//            let deltaX = CGFloat(shape.frame.origin.x) - shiftX....doens't change it back...
            
            if deltaX < 100 && deltaX > -50 {
                if shape.form == .bubble {
                    shape.makeBox()
                }
            }
            else {
                if shape.form == .box {
                    shape.makeBubble()
//                    shape.frame.size.width = shape.frame.size.width * xFactor
//                    shape.frame.size.height = shape.frame.size.height * xFactor
                }
                let xFactor = (deltaX / -160) + 3
                shape.transform = CGAffineTransform(scaleX: xFactor, y: xFactor)
            }
        }
        

        
    }
    
    
    
    func makeBox() {
        
//        print("\(self.message.senderID)..........make box")
        
        form = .box
        
//        self.transform = CGAffineTransform(scaleX: scaleback, y: scaleback)
        self.transform = CGAffineTransform.identity
        
        for subv in self.subviews {
            subv.removeFromSuperview()
        }
        
        layer.frame = CGRect(x: layer.frame.origin.x, y: layer.frame.origin.y, width: 160, height: 70)
        
        layer.borderWidth = 2
        layer.borderColor = UIColor.red.cgColor
        layer.cornerRadius = layer.frame.size.width / 8
        layer.masksToBounds = true
        
        idImageView.frame = CGRect(x: 0, y: 0, width: layer.frame.width * 0.32, height: layer.frame.height * 0.66)
        
        messageField.frame = CGRect(x: layer.frame.width * 0.32, y: 0, width: layer.frame.width * 0.68, height: layer.frame.height)
        
        senderID.frame = CGRect(x:0, y: layer.frame.height * 0.68, width: layer.frame.width * 0.32, height: layer.frame.height * 0.3)
        
        idImageView.layer.cornerRadius = 5
        
        self.addSubview(idImageView)
        self.addSubview(messageField)
        self.addSubview(senderID)
        

    }
    
    
    
    func makeBubble() {
        
        
        form = .bubble
        
        for subv in self.subviews {
            subv.removeFromSuperview()
        }
        
        layer.frame = CGRect(x: originX, y: originY, width: 30, height: 30)
        
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
        
    }
    
    
    
    
    //MARK CLass PROPERTIES
    
    let messageStyle = [NSFontAttributeName: UIFont(name: "Chalkduster", size: 8.0)! ]
    let idStyle = [NSFontAttributeName: UIFont(name: "Chalkduster", size: 12.0)! ]
    
    
    var message: MessageData
    var idImageView = UIImageView()
    var messageField = UITextField()
    var senderID = UILabel()
    var originX = CGFloat()
    var originY = CGFloat()
    var form: Form = .bubble
    
    var pos: Int {
        return ShapeV5.allSorted.index(of: self)!
    }
  
    
    var posInScreen: Int? {
        if let num = ShapeV5.inScreen.index(of: self) {
                return num
    }
         else {return nil}
    }
    
    init(message: MessageData) {
        
        self.message = message
        
//        idImageView.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        idImageView.contentMode = UIViewContentMode.scaleAspectFit
        
        idImageView.image = message.idImage
 
        let styledMessage = NSAttributedString(string: message.message, attributes: messageStyle)
        let styledID = NSAttributedString(string: message.senderID, attributes: idStyle)
        
        messageField.attributedText = styledMessage
        senderID.attributedText = styledID
    
        

        originY = CGFloat(message.time / 100)
        originX = CGFloat(message.dist * 200)
        
        super.init(frame: CGRect(x: originX, y: originY, width: 30 , height: 30))
        
//        idImageView.frame = self.frame
        layer.borderWidth = 2
        layer.borderColor = UIColor.red.cgColor
        layer.cornerRadius = layer.frame.size.width / 2
        layer.masksToBounds = true
        
        idImageView.translatesAutoresizingMaskIntoConstraints = false
        idImageView.clipsToBounds = false
        //        idImageView.center = center
        idImageView.layer.masksToBounds = false

        
        addSubview(idImageView)
        

//
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




//
//        for box in boxesSorted {
//        }
//        print(index)

//        if boxesSorted.count > 1 {
//            for i in 1...boxesSorted.count {
//                if boxesSorted[i].frame.intersects(boxesSorted[i-1].frame) {
//                    boxesSorted[i].frame.origin.y = boxesSorted[i-1].frame.origin.y + boxesSorted[i-1].frame.size.height
//                }
//
//            }
//
//        }


//         let endCheck = index.count - 2
//        if endCheck >= 0 {
//            for i in 0...endCheck {
//                let firstBoxPos = index[i]
//                let secondBoxPos = index[i+1]
//                if allSorted[firstBoxPos].frame.intersects(allSorted[secondBoxPos].frame) {
//                    let secondBoxPosY = allSorted[secondBoxPos].frame.origin.y
//                    allSorted[secondBoxPos].frame.origin.y = allSorted[firstBoxPos].frame.origin.y + allSorted[firstBoxPos].frame.height
//                    let delta = allSorted[secondBoxPos].frame.origin.y - secondBoxPosY
//
//                    if secondBoxPos - firstBoxPos > 0 {
//                        let nextBox = firstBoxPos + 1
//                        for i in nextBox...secondBoxPos {
//                            let span2 = secondBoxPosY - allSorted[i].frame.origin.y
//                            let span1 = allSorted[i].frame.origin.y - allSorted[firstBoxPos].frame.origin.y
//                            let proportion = span1 / (span1 + span2)
//                            allSorted[i].frame.origin.y += proportion * delta
//                        }
//                    }
//
//
//                }
//
//
//            }



//        for index in 0...allSorted.count - 1 {
//
//            if allSorted[index].form == .box {
//                let span = allSorted[index].frame.size.height + allSorted[index].frame.origin.x
//            }
//
//            if allSorted[index].frame.intersects(allSorted[index + 1].frame) {
//                print("working")
//
//            }
//
//
//
//        }
//    class func getInScreen(shiftX: CGFloat) -> [ShapeV5] {

//    }
//    var boxIndex = [Int] {
//            var index = [Int]()
//            for ind in 0...allSorted.count - 1 {
//                if allSorted[ind].form == .box {
//                    index.append(ind)
//                }
//            }
//            return index
//    }

//        var index = [Int]()
//        for ind in 0...allSorted.count - 1 {
//            if allSorted[ind].form == .box {
//                print("\(allSorted[ind].message.senderID).....\(allSorted[ind].pos)...")
//                index.append(ind)
//            }
//        }

//
//    class func getInScreen(shiftX: CGFloat) -> [ShapeV5] {
//        var inScreen = [ShapeV5]()
//        for box in allSorted {
//            let dist = CGFloat(box.message.dist)
//            if (dist - shiftX < 200) && (dist - shiftX > 0) {
//                inScreen.append(box)
//            }
//        }
//        return inScreen
//    }
//





