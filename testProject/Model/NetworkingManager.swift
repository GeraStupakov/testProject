//
//  NetworkingManager.swift
//  testProject
//
//  Created by Георгий Ступаков on 2/16/21.
//

import UIKit

typealias JSON = [String: AnyObject]

class NetworkingManager {
    
    static let shared = NetworkingManager()
    
    let flickrUrl = "https://api.flickr.com/services/rest/?format=json&nojsoncallback=1&sort=relevance&method=flickr.interestingness.getList&per_page=100&extras=url_m&api_key=daa5408f3c1f86c6836c0c976ceb2f23"
    
    let session = URLSession(configuration: .default)
    
    func getFlickrs(complitionBlock: @escaping (FlickrData) -> ()) {
        
        guard let url = URL(string: flickrUrl) else { return }
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let safeData = data else { return }
            do {
                guard let json = try JSONSerialization.jsonObject(with: safeData,options: []) as? JSON else { return }
                let networkData = try FlickrData(json: json)
                DispatchQueue.main.async {
                    complitionBlock(networkData)
                }
            } catch {
                print("FETCH ERROR: \(error)")
            }
        }
        task.resume()
    }
    
    
    func downloadFlickers(from urlString: String, complitionBlock: @escaping (UIImage) -> ()){
        guard let url = URL(string: urlString) else { return }
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let safeData = data,
                  let image = UIImage(data: safeData)
            else { return }
            DispatchQueue.main.async {
                complitionBlock(image)
            }
            if error != nil {
                print("DOWNLOAD ERROR: \(error!)")
            }
        }
        task.resume()
    }
    
}
