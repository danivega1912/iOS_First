//
//  Stadium.swift
//  Obligatorio1
//
//  Created by Daniel Vega on 5/1/18.
//  Copyright © 2018 Daniel Vega. All rights reserved.
//

import Foundation

class Stadium {
    
    private var id:Int
    private var name:String
    private var picture:String
    
    init(identifier:Int, name:String, image:String) {
        self.id = identifier
        self.name = name
        self.picture = image
    }
    
    func getName() -> String {
        return name
    }
    
    func getImage() -> String {
        return picture
    }
    
}
