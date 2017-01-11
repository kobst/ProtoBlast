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
import MapKit


class Plot: UIView {
    static var all = [Plot]()
    
    class func update(deltaX: CGFloat, deltaY: CGFloat) {
        for plot in Plot.all {
            plot.frame.origin.x = plot.originX - deltaX/5
            plot.frame.origin.y = plot.originY - deltaY/10
            if plot.frame.origin.x < 0 || plot.frame.origin.y < 0 {
                plot.isHidden = true
            }
            if plot.frame.origin.x > 0 && plot.frame.origin.y > 0 {
                plot.isHidden = false
            }
        }
    }
    
    var originX: CGFloat
    var originY: CGFloat
    
    init(x: CGFloat, y: CGFloat) {
        originX = x
        originY = y
        super.init(frame: CGRect(x: originX, y: originY, width: 5 , height: 5))
        backgroundColor = UIColor.cyan
        layer.cornerRadius = layer.frame.width / 2
        Plot.all.append(self)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//class Dashboard: UIView {
//    
//    func plotMap(deltaX: CGFloat, deltaY: CGFloat) {
//   
//        for shape in ShapeV5.allSorted {
//            let rawY = shape.frame.origin.y - deltaY
//            let rawX = shape.frame.origin.x - deltaX
//            let plotY = rawY / 10
//            let plotX = rawX / 10
//            let mapPlot = Plot(x: plotX, y: plotY)
//            self.addSubview(mapPlot)
//        }
//    }
//    
// 
//    
//    init(frame: CGRect, view: UIView) {
//        super.init(frame: frame)
//        self.setup(view: view)
//        
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    
//    
//    private func setup(view: UIView){
//        self.translatesAutoresizingMaskIntoConstraints = false
//        backgroundColor = UIColor.black
//        clipsToBounds = true
//        
//        
//    
//    let horizontalConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
//    let verticalConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: 0)
//    let widthConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.width, multiplier: 1, constant: 100)
//    let heightConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.height, multiplier: 0.08, constant: 100)
//    
//    view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
//    
//    
//     }
//    
//    
//    
//}
//
//


//class MapDetail: MKMapView {
//    
//    init(frame: CGRect, origin: CLLocation, place: CLLocation) {
//    
//        let latitude: CLLocationDegrees = 27.1
//        
//        let longitude: CLLocationDegrees = 78.0
//        
//        let lanDelta: CLLocationDegrees = 0.05
//        
//        let lonDelta: CLLocationDegrees = 0.05
//        
//        let span = MKCoordinateSpan(latitudeDelta: lanDelta, longitudeDelta: lonDelta)
//        
//        let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
//        
//        let region = MKCoordinateRegion(center: coordinates, span: span)
//        
//        setRegion(region, animated: true)
//
//        
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//}












class ShapeV5: UIView {
    
    enum Form {
        case bubble
        case box
        case detail
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
            
            if deltaX < 100 && deltaX > -100 {
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
        layer.borderColor = outlineColor.cgColor
        layer.cornerRadius = layer.frame.size.width / 8
        layer.masksToBounds = true
        
        
        senderID.textAlignment = .center
        senderID.backgroundColor = UIColor.cyan
        
        messageField.backgroundColor = outlineColor
        
        idImageView.frame = CGRect(x: 0, y: 0, width: layer.frame.width * 0.32, height: layer.frame.height * 0.66)
        
        messageField.frame = CGRect(x: layer.frame.width * 0.32, y: 0, width: layer.frame.width * 0.68, height: layer.frame.height)
        
        senderID.frame = CGRect(x:0, y: layer.frame.height * 0.68, width: layer.frame.width, height: layer.frame.height * 0.3)
        
//        senderID.frame = CGRect(x:0, y: layer.frame.height * 0.68, width: layer.frame.width * 0.32, height: layer.frame.height * 0.3)
        
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
        layer.borderColor = outlineColor.cgColor
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
    
    
    func makeDetail(shiftX: CGFloat, shiftY: CGFloat, superView: UIView) {
        
        form = .detail
        
        for subv in self.subviews {
            subv.removeFromSuperview()
        }
        
        
        self.backgroundColor = UIColor.black
    
        layer.borderWidth = 2
        layer.borderColor = outlineColor.cgColor
        layer.cornerRadius = layer.frame.size.width / 8
        layer.masksToBounds = true
        
        
        let map = MKMapView()
        
        let locationDestination = Modelv2.shared.coordinates[message.senderID]
        let userLocation = CLLocation(latitude: 40.7398516, longitude: -73.9924008)
        
        let x = (userLocation.coordinate.latitude + (locationDestination?.coordinate.latitude)!) / 2
        let y = (userLocation.coordinate.longitude + (locationDestination?.coordinate.longitude)!) / 2
        
        let latitude: CLLocationDegrees = x
        
        let longitude: CLLocationDegrees = y
        
        let lanDelta: CLLocationDegrees = 0.0005
        
        let lonDelta: CLLocationDegrees = 0.0005
        
        let span = MKCoordinateSpan(latitudeDelta: lanDelta, longitudeDelta: lonDelta)
        
        let center = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let region = MKCoordinateRegion(center: center, span: span)
        
        map.setRegion(region, animated: true)
        
        
        senderID.textAlignment = .center
        senderID.backgroundColor = UIColor.cyan
        messageField.backgroundColor = outlineColor
        
        
        translatesAutoresizingMaskIntoConstraints = false
        autoresizesSubviews = true
        
        

        
        idImageView.frame = CGRect(x: 0, y: 0, width: layer.frame.width * 0.15, height: layer.frame.height * 0.08)
        
        messageField.frame = CGRect(x: layer.frame.width * 0.10, y: layer.frame.height * 0.08, width: layer.frame.width * 0.8, height: layer.frame.height * 0.2)
        
        senderID.frame = CGRect(x: layer.frame.width * 0.18, y: 0, width: layer.frame.width * 0.75, height: layer.frame.height * 0.1)
        
        map.frame = CGRect(x: 0, y: layer.frame.height * 0.65, width: layer.frame.width, height: layer.frame.height * 0.35)
        
        
        
        self.addSubview(idImageView)
        self.addSubview(messageField)
        self.addSubview(senderID)
        self.addSubview(map)
        
        UIView.animate(withDuration: 1.0, delay: 0.3, options: [.curveEaseIn], animations: {
            
            superView.layoutIfNeeded()
            
            //            self.frame = CGRect(x: shiftX + (superView.frame.size.width * 0.1), y: shiftY + 10, width: superView.frame.size.width * 0.8, height: superView.frame.size.height * 0.65)
            
            self.frame = CGRect(x: shiftX, y: shiftY, width: superView.frame.size.width, height: superView.frame.size.height * 0.75)
            
            
            self.layer.zPosition = 100
            
        }, completion: { complete in
            
            self.backgroundColor = UIColor.cyan
//            self.idImageView.frame = CGRect(x: 0, y: 0, width: self.layer.frame.width * 0.15, height: self.layer.frame.height * 0.08)
//        
//            
//            self.messageField.frame = CGRect(x: self.layer.frame.width * 0.10, y: self.layer.frame.height * 0.08, width: self.layer.frame.width * 0.8, height: self.layer.frame.height * 0.2)
//            
//            self.senderID.frame = CGRect(x: self.layer.frame.width * 0.18, y: 0, width: self.layer.frame.width * 0.75, height: self.layer.frame.height * 0.1)
//            
//            map.frame = CGRect(x: 0, y: self.layer.frame.height * 0.65, width: self.layer.frame.width, height: self.layer.frame.height * 0.35)
//            
//            
//            self.addSubview(
//                self.idImageView)
//            self.addSubview(self.messageField)
//            self.addSubview(self.senderID)
//            self.addSubview(map)
            
            
        })

        
//        print(superView.frame)
//        
//        self.removeFromSuperview()
//        
//        superView.addSubview(self)
        
//        let horizontalConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: superView, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
//        let verticalConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: superView, attribute: NSLayoutAttribute.top, multiplier: 1.1, constant: 0)
//        let widthConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: superView, attribute: NSLayoutAttribute.width, multiplier: 0.85, constant: 0)
//        let heightConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: superView, attribute: NSLayoutAttribute.height, multiplier: 0.65, constant: 0)
//        
//        superView.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])

    
    }
    
    
    
    func makeColor(per: Double) -> UIColor {
        let color1red = Double(209/255)
        let color1green = Double(15/255)
        let color1blue = Double(60/255)
        let color2red = Double(142/255)
        let color2green = Double(190/255)
        let color2blue = Double(210/255)

        let resultRed = color1red + per * (color2red - color1red);
        let resultGreen = color1green + per * (color2green - color1green);
        let resultBlue = color1blue + per * (color2blue - color1blue);
        
        let result = UIColor(red: CGFloat(resultRed), green: CGFloat(resultGreen), blue: CGFloat(resultBlue), alpha: 1)
        
        return result
        
    }
    

    
//    func resizeImage(image: UIImage) -> UIImage {
//        
//        // Figure out what our orientation is, and use that to form the rectangle
//        let newSize = CGSize(width: 20, height: 20)
//        
//        // This is the rect that we've calculated out and this is what is actually used below
//        let rect = CGRect(x: 0, y: 0, width: 20, height: 20)
//        
//        // Actually do the resizing to the rect using the ImageContext stuff
//        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
//        image.draw(in: rect)
//        let newImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        
//        return newImage!
//    }
    
    
    
    
    //MARK CLass PROPERTIES
    
    let messageStyle = [NSFontAttributeName: UIFont(name: "Futura", size: 6.0)! ]
    let idStyle = [NSFontAttributeName: UIFont(name: "Futura", size: 9.0)! ]

    
    
    var message: MessageData
    var idImageView = UIImageView()
    var messageField = UITextView()
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
    
    
    var outlineColor: UIColor {
        
        let per = Double(originY / 500)
//        let color1red = Double(209/255)
//        let color1green = Double(15/255)
//        let color1blue = Double(60/255)
//        let color2red = Double(142/255)
//        let color2green = Double(190/255)
//        let color2blue = Double(210/255)
        
                let color1red = 209.0
                let color1green = 15.0
                let color1blue = 60.0
                let color2red = 142.0
                let color2green = 190.0
                let color2blue = 210.0
        
        
        
        let resultRed = (color1red + per * (color2red - color1red))
        let resultGreen = (color1green + per * (color2green - color1green))
        let resultBlue = (color1blue + per * (color2blue - color1blue))
        
        let result = UIColor(red: CGFloat(resultRed/255), green: CGFloat(resultGreen/255), blue: CGFloat(resultBlue/255), alpha: 1)
        
        return result
        
    }
    
    init(message: MessageData) {
        
        self.message = message
        
//        idImageView.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        idImageView.contentMode = UIViewContentMode.scaleAspectFit
        
//        idImageView.image = message.idImage
        

        let styledMessage = NSAttributedString(string: message.message, attributes: messageStyle)
        let styledID = NSAttributedString(string: message.senderID, attributes: idStyle)
        
        messageField.attributedText = styledMessage
        senderID.attributedText = styledID
      
        
//        originX = CGFloat((message.dist * 200.0)
//        originY = CGFloat(message.time / 15.0)
        
        
        originX = CGFloat(message.dist * 200)
        originY = CGFloat(message.time / 100.0)
        
   
        super.init(frame: CGRect(x: originX, y: originY, width: 20, height: 20))
        
        
        layer.borderWidth = 2
        layer.borderColor = outlineColor.cgColor
        layer.cornerRadius = layer.frame.size.width / 2
        layer.masksToBounds = true
        layer.zPosition = CGFloat(100.0 * message.dist * -1)
        idImageView.frame = CGRect(x: 0, y: 0, width: layer.frame.width/2, height: layer.frame.height/2)
//        idImageView.image = resizeImage(image: message.idImage)
        idImageView.translatesAutoresizingMaskIntoConstraints = false
        idImageView.clipsToBounds = false

        
        
        
        idImageView.layer.masksToBounds = true

        
        addSubview(idImageView)
//
        translatesAutoresizingMaskIntoConstraints = false
        autoresizesSubviews = false
        
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





