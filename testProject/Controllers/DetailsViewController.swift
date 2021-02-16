//
//  DetailsViewController.swift
//  testProject
//
//  Created by Георгий Ступаков on 2/15/21.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var detailFlickrs: FlickrModel?
    
    @IBOutlet weak var bigImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = detailFlickrs?.title
        
        detailFlickrs?.image(completionBlock: { image in
            self.bigImageView.image = image
        })
    }
    
}
