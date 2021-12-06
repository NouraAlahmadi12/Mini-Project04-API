//
//  ViewController.swift
//  MiniProject-04
//
//  Created by Noura Alahmadi on 02/05/1443 AH.
//
import Foundation
import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataLanguage()
        getDataTranslate()
        
    }
    
    func getDataLanguage() {
        let headers = [
            "accept-encoding": "application/gzip",
            "x-rapidapi-host": "google-translate1.p.rapidapi.com",
            "x-rapidapi-key": "2e5c3f114fmsh1466e049bcc5f54p1e55e2jsn3d8c82c01c80"
        ]
        
        
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://google-translate1.p.rapidapi.com/language/translate/v2/languages")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data: Data!, response: URLResponse?, error: Error?) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
            }
        })
        
        
        dataTask.resume()
    }
    
   func getDataTranslate() {

        let headers = [
            "content-type": "application/x-www-form-urlencoded",
            "accept-encoding": "application/gzip",
            "x-rapidapi-host": "google-translate1.p.rapidapi.com",
            "x-rapidapi-key": "2e5c3f114fmsh1466e049bcc5f54p1e55e2jsn3d8c82c01c80"
        ]

        let postData = NSMutableData(data: "q=Hello, world!".data(using: String.Encoding.utf8)!)
        postData.append("&target=es".data(using: String.Encoding.utf8)!)
        postData.append("&source=en".data(using: String.Encoding.utf8)!)

        let request = NSMutableURLRequest(url: NSURL(string: "https://google-translate1.p.rapidapi.com/language/translate/v2")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
            }
        })

        dataTask.resume()
    }
}

