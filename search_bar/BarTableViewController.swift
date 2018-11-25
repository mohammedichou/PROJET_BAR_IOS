//
//  BarTableViewController.swift
//  search_bar
//
//  Created by mohammed ichou on 24/11/2018.
//  Copyright © 2018 mohammed ichou. All rights reserved.
//

import UIKit

class BarTableViewController: UITableViewController {
    
    //MARK : PROPERTIES
    
    var Bars = [Bar]()
    var cell_Selected = String()
    var latitude_select = Double()
    var longitude_select = Double()
    var adresse_select = String()
    var URL_select = String()
    var Tags_select = String()

    override func viewDidLoad() {
        super.viewDidLoad()
         tableView.rowHeight = 100
        loadBar()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Bars.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Idcell", for: indexPath) as? BarTableViewCell else {
            fatalError("erreur de conversion")
        }
        
        let bar = Bars[indexPath.row]
        cell.LabelText.text = bar.NomBar as String
        if let url = NSURL(string:bar.URLImage as String){
            if let data = NSData(contentsOf: url as URL){
                cell.ImageBar.image = UIImage(data: data as Data)
                cell.ImageBar.layer.cornerRadius = cell.ImageBar.frame.width/2
                cell.ImageBar.layer.masksToBounds = true
            }
        }
        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    MARK: - Navigation

    In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.cell_Selected = Bars[indexPath.row].NomBar as String
        self.latitude_select = Bars[indexPath.row].P1.Latitude
        self.longitude_select = Bars[indexPath.row].P1.longitude
        self.adresse_select = Bars[indexPath.row].Adresse as String
        self.URL_select = Bars[indexPath.row].URLImage as String
        self.Tags_select = Bars[indexPath.row].Tags as String
        self.performSegue(withIdentifier: "GoToBar", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToBar"{
            let Barcontroller = segue.destination as! BarViewController
            Barcontroller.cellule = self.cell_Selected
            Barcontroller.Latitude = self.latitude_select
            Barcontroller.longitude = self.longitude_select
            Barcontroller.adresse = self.adresse_select
            Barcontroller.URL = self.URL_select
            Barcontroller.Tags = self.Tags_select
        }
    }
    
    
    
    
    
    //MARK: PRIVATE FUNC
    
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
                            print(test1["tags"]as! String)
                            let test7 = test1["tags"] as! NSString
                            let bar1 = Bar(NomBar: test2, URLImage: test3, P1:Point(Latitude: test4, longitude: test5),Adresse: test6, Tags: test7)
                            
                            
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
