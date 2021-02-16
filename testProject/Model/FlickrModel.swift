//
//  NetworkModel.swift
//  testProject
//
//  Created by Георгий Ступаков on 2/15/21.
//

import UIKit

struct FlickrModel {

    var url: String
    var title: String
    
    init?(json: JSON) {
        guard let url = json["url_m"] as? String else { return nil }
        guard let title = json["title"] as? String else { return nil }
        self.url = url
        self.title = title
    }
    
    func image(completionBlock: @escaping (UIImage) -> Void) {
        NetworkingManager.shared.downloadFlickers(from: url) { image in
            completionBlock(image)
        }
    }
}
