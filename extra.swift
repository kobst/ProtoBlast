//
//  extra.swift
//  
//
//  Created by Edward Han on 1/11/17.
//
//

import Foundation

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




