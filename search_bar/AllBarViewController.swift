//
//  AllBarViewController.swift
//  search_bar
//
//  Created by mohammed ichou on 25/11/2018.
//  Copyright © 2018 mohammed ichou. All rights reserved.
//

import UIKit
import MapKit

class AllBarViewController: UIViewController{
    
    @IBOutlet weak var mapall: MKMapView!
    var locationManager = CLLocationManager()
    
    var Bars = [Bar]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBar()
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    private func loadBar(){
        
        var i: Int
        for i in 1...15{
            if let url = Bundle.main.url(forResource: "Pensebete", withExtension: "json")
            {
                if let data = NSData(contentsOf: url) {
                    do {
                        
                        let jsonResult: NSDictionary? = try JSONSerialization.jsonObject(with: data as Data) as? NSDictionary
                        if let jsonResult = jsonResult{
                            // print("JsonRESULT est bien convertit")
                            let test = jsonResult["bars"]! as! NSArray
                            let test1 = test[i] as! NSDictionary
                            let test2 = test1["name"] as! NSString
                            let test3 = test1["image_url"] as! NSString
                            let test4 = test1["latitude"] as! Double
                            let test5 = test1["longitude"] as! Double
                            let test6 = test1["address"] as! NSString
                            let test7 = test1["tags"] as! NSString
                            let bar1 = Bar(NomBar: test2, URLImage: test3, P1:Point(Latitude: test4, longitude: test5), Adresse: test6, Tags: test7)
                            let point = annot(title: bar1.NomBar as String, locationName: "", discipline: "", coordinate: CLLocationCoordinate2D(latitude: bar1.P1.Latitude, longitude: bar1.P1.longitude))
                            
                            mapall.addAnnotation(point)
                            let span =  MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.866667, longitude: 2.333333), span: span)
                            mapall.setRegion(region, animated: true)
                            
                            
                            Bars += [bar1]
                            
                            
                            
                            
                            
                        }
                    } catch {
                        print("Error!! Unable to parse  \("Pensebete").json")
                    }
                    
                }
            }
            
        }
        

}
}
