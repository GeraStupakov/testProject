//
//  NetworkData.swift
//  testProject
//
//  Created by Георгий Ступаков on 2/15/21.
//

import Foundation

struct FlickrData {

    let flickrs: [FlickrModel]
    
    init(json: JSON) throws {
        guard let photos = json["photos"] as? JSON,
              let photo = photos["photo"] as? [JSON]
        else {
            throw MyError.parseError
        }
        
        let flickrs = photo.compactMap { FlickrModel(json: $0) }
        
        self.flickrs = flickrs
        
    }
    
}



