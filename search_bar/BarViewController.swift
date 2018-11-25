//
//  BarViewController.swift
//  search_bar
//
//  Created by mohammed ichou on 25/11/2018.
//  Copyright © 2018 mohammed ichou. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
class BarViewController: UIViewController {
    
    @IBOutlet weak var mapKit: MKMapView!
    @IBOutlet weak var LabelBar: UILabel!
    @IBOutlet weak var LabelAdresse: UILabel!
    @IBOutlet weak var imageBar: UIImageView!
    @IBOutlet weak var LabelTags: UILabel!
    var cellule = String()
    var Latitude = Double()
    var longitude = Double()
    var adresse = String()
    var URL = String()
    var Tags = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Latitude)
        print(longitude)
        
        let point = annot(title: cellule, locationName: "", discipline: "", coordinate: CLLocationCoordinate2D(latitude: Latitude, longitude: longitude))
        mapKit.addAnnotation(point)
        mapKit.setRegion(point.region, animated: true)
        
        
        imageBar.image = UIImage(named: "image_bar")
        
        if let url = NSURL(string:URL){
            if let data = NSData(contentsOf: url as URL){
                imageBar.image = UIImage(data: data as Data)
                //imageBar.layer.cornerRadius = imageBar.frame.width/2
                //imageBar.layer.masksToBounds = true
            }
        }
        imageBar.layer.cornerRadius = imageBar.frame.width/2
        LabelAdresse.numberOfLines = 0
        LabelTags.numberOfLines = 0
        imageBar.layer.masksToBounds = true
        //Textadresse.text = adresse
        LabelAdresse.text = adresse
        LabelBar.text = cellule
        LabelTags.text = Tags
        

    }
    
    @IBAction func actionBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
