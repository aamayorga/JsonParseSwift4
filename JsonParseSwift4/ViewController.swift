//
//  ViewController.swift
//  JsonParseSwift4
//
//  Created by Ansuke on 2/28/18.
//  Copyright © 2018 AM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    struct Course: Decodable {
        let id: Int?
        let name: String?
        let link: String?
        let imageUrl: String?
        
//        init(json: [String:Any]) {
//            id = json["id"] as? Int ?? -1
//            name = json["name"] as? String ?? ""
//            link = json["link"] as? String ?? ""
//            imageUrl = json["imageUrl"] as? String ?? ""
//
//        }
    }
    
    struct WebsiteDescription: Decodable {
        let name: String
        let description: String
        let courses: [Course]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/courses_missing_fields"
        guard let url = URL(string: jsonUrlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
//            let dataAsString = String(data: data, encoding: .utf8)
//            print(dataAsString)
            
            do {
                
                
//                let websiteDescription = try JSONDecoder().decode(WebsiteDescription.self, from: data)
//                dump(websiteDescription.courses[0])
//                print(websiteDescription.courses[0].id)

                let courses = try JSONDecoder().decode([Course].self, from: data)
                dump(courses)
                
                // Swift 2/3/Obj-C
//                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any] else { return }
//
//                let course = Course(json: json)
//                dump(course)
//                print(course.name)
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
            
        }.resume()
        
//        let myCourse = Course(id: 1, name: "Me", link: "My Link", imageUrl: "My image url")
    }
}

