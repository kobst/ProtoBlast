//
//  LabTestViewController.swift
//  protoBlast
//
//  Created by Edward Han on 12/14/16.
//  Copyright © 2016 Edward Han. All rights reserved.
//

import UIKit

class LabTestViewController: UIViewController {
    

    @IBOutlet weak var anotherView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        anotherView.backgroundColor = UIColor.darkGray
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    private func fetchData(searchterms: String, closure: @escaping (Data) -> ()) {
        
        let apiKey = "&api_key=dc6zaTOxFJmzC"
        let terms = searchterms + apiKey
        let endpoint = "https://api.giphy.com/v1/gifs/search?q=" + terms
        let url = URLRequest(url: URL(string: endpoint)!)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url) { (data, response, error) in
            // TODO: add error handling
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            closure(responseData)
        }
        task.resume()
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        fetchData(searchterms: "cats", closure: {response in
            
            do {
                let object =  try JSONSerialization.jsonObject(with: response, options: .mutableContainers) as! [String: Any]
                
                let arrayDict = object["data"] as! [[String: Any]]
                let randomNumber = Int(arc4random()%10)
                let dictOne = arrayDict[randomNumber] as [String:Any]
                
                let imageDict = dictOne["images"] as! [String:Any]
                
                let fixedHeightDict = imageDict["fixed_height"] as! [String: String]
                let mp4Url = fixedHeightDict["url"]! as String
                
                DispatchQueue.global(qos: .background).async {
                    let url = URL(string: mp4Url)!
                    URLSession.shared.dataTask(with: url) { (data, _, _) in
                        guard let responseData = data else {
                            return
                        }
                        print(url)
                        let image = UIImage(data: responseData)
                       
                        DispatchQueue.main.async {
//                            ShapeV2.spawnBox(message: "test", senderName: "testname", idImage: image!, dist: 1.5, time: 2.0, containingView: self.view)
                            let x = ShapeV2(message: "test 2", senderName: "test name 2", idImage: image!, dist: 2.5, time: 3.0, containingView: self.anotherView, setCornerRadius: true)
                        
                        }
                        }.resume()
                }
                
                
                
                
                
                
                
            }catch {
                print(error)
            }
            
            
        })


    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
