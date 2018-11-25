//
//  Bar.swift
//  search_bar
//
//  Created by mohammed ichou on 24/11/2018.
//  Copyright © 2018 mohammed ichou. All rights reserved.
//

import UIKit

class Bar  {
    
    //MARK : propriété
    
    let NomBar : NSString
    let URLImage : NSString
    let P1 : Point
    let Adresse : NSString
    let Tags : NSString
    
    
    init(NomBar: NSString, URLImage : NSString, P1: Point, Adresse:NSString, Tags: NSString) {
        self.NomBar = NomBar
        self.URLImage = URLImage
        self.P1 = P1
        self.Adresse = Adresse
        self.Tags = Tags
    }
    
}
