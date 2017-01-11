//
//  DetailViewController.swift
//  protoBlast
//
//  Created by Edward Han on 1/10/17.
//  Copyright © 2017 Edward Han. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {
    
    var detailShape: ShapeV5!

    
    @IBOutlet weak var senderName: UILabel!
    
    @IBOutlet weak var backgroundProfile: UIImageView!
    
    
    @IBOutlet weak var imageProfile: UIImageView!
    
    
    @IBOutlet weak var mapView: MKMapView!
 
    
    @IBOutlet weak var messageField: UITextView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let userLocation = CLLocation(latitude: 40.7398516, longitude: -73.9924008)
        
        let destinationCoordinate = Modelv2.shared.coordinates[detailShape.message.senderID]
        
        let x = (userLocation.coordinate.latitude + (destinationCoordinate?.coordinate.latitude)!) / 2
        let y = (userLocation.coordinate.longitude + (destinationCoordinate?.coordinate.longitude)!) / 2
        
        
        let latitude: CLLocationDegrees = x
        
        let longitude: CLLocationDegrees = y
        
        let lanDelta: CLLocationDegrees = 0.0005
        
        let lonDelta: CLLocationDegrees = 0.0005
        
        let span = MKCoordinateSpan(latitudeDelta: lanDelta, longitudeDelta: lonDelta)
        
        let center = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let region = MKCoordinateRegion(center: center, span: span)
        
        mapView.setRegion(region, animated: true)
        
        
        
        
        
        senderName.text = detailShape.message.senderID
        imageProfile.image = detailShape.message.idImage
        messageField.text = detailShape.message.message
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
