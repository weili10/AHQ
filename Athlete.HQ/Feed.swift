//
//  Feed.swift
//  Athlete.HQ
//
//  Created by Wei Li on 15/3/18.
//  Copyright © 2018 Wei Li. All rights reserved.
//

import Foundation

import UIKit

class Feed {
    var name: String
    var photo: UIImage?
    var text: String
    
    init?(name: String, photo: UIImage?, text: String) {
        if name.isEmpty || text.isEmpty {
            return nil
        }
        
        self.name = name
        self.photo = photo
        self.text = text
    }
}
