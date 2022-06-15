//
//  ViewController.swift
//  HTTPMethodsAlamofireExample
//
//  Created by John Codeos on 5/7/20.
//  Copyright © 2020 John Codeos. All rights reserved.
//

import Alamofire
import UIKit

class ViewController: UIViewController {
    @IBOutlet var postMethodButton: UIButton!
    @IBOutlet var getMethodButton: UIButton!
    @IBOutlet var putMethodButton: UIButton!
    @IBOutlet var deleteMethodButton: UIButton!
    
    var detailsVCPrintedJson: String?
    var detailsVCTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Fix navigation bar color in iOS 15 and above
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            appearance.backgroundColor = UIColor(named: "primaryColor")
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        }
    }
    
    @IBAction func postMethodAction(_ sender: UIButton) { postMethod() }
    
    @IBAction func getMethodAction(_ sender: UIButton) { getMethod() }
    
    @IBAction func putMethodAction(_ sender: UIButton) { putMethod() }
    
    @IBAction func deleteMethodAction(_ sender: UIButton) { deleteMethod() }
    
    func postMethod() {
        /*
         If the server uses consumer key and consumer secret, uncomment the follow lines
         */
        
        let params: Parameters = [
            //            "consumer_key": "MY_CONSUMER_KEY",
//            "consumer_secret": "MY_CONSUMER_SECRET",
            "name": "Jack",
            "salary": "3540",
            "age": "23"
        ]
        
        /*
         If you are using Basic Authentication uncomment the follow line and add your base64 string
         Replace 'nil' with 'httpHeaders' in headers
         */
        
//        let httpHeaders: HTTPHeaders = [
//            "Authorization": "Basic MY_BASIC_AUTH_STRING"
//        ]
        
        AF.request("http://dummy.restapiexample.com/api/v1/create", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200 ..< 299).responseData { response in
            switch response.result {
                case .success(let data):
                    do {
                        guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                            print("Error: Cannot convert data to JSON object")
                            return
                        }
                        guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                            print("Error: Cannot convert JSON object to Pretty JSON data")
                            return
                        }
                        guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                            print("Error: Could print JSON in String")
                            return
                        }
                
                        self.openDetailsVC(jsonString: prettyPrintedJson, title: "POST METHOD")
                    } catch {
                        print("Error: Trying to convert JSON data to string")
                        return
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    func getMethod() {
        /*
         If the server uses consumer key and consumer secret, uncomment the follow lines and replace 'nil' with 'params' in parameters
         */
        
//        let params: Parameters = [
//            "consumer_key": "MY_CONSUMER_KEY",
//            "consumer_secret": "MY_CONSUMER_SECRET"
//        ]
        
        /*
         If you are using Basic Authentication uncomment the follow line and add your base64 string
         Replace 'nil' with 'httpHeaders' in headers
         */
        
//        let httpHeaders: HTTPHeaders = [
//            "Authorization": "Basic MY_BASIC_AUTH_STRING"
//        ]
        
        AF.request("http://dummy.restapiexample.com/api/v1/employees", parameters: nil, headers: nil).validate(statusCode: 200 ..< 299).responseData { response in
            switch response.result {
                case .success(let data):
                    do {
                        guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                            print("Error: Cannot convert data to JSON object")
                            return
                        }
                        guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                            print("Error: Cannot convert JSON object to Pretty JSON data")
                            return
                        }
                        guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                            print("Error: Could print JSON in String")
                            return
                        }
                        self.openDetailsVC(jsonString: prettyPrintedJson, title: "GET METHOD")
                    } catch {
                        print("Error: Trying to convert JSON data to string")
                        return
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    func putMethod() {
        /*
         If the server uses consumer key and consumer secret, uncomment the follow lines
         */
        
        let params: Parameters = [
            //            "consumer_key": "MY_CONSUMER_KEY",
//            "consumer_secret": "MY_CONSUMER_SECRET",
            "name": "Nicole",
            "job": "iOS Developer"
        ]
        
        /*
         If you are using Basic Authentication uncomment the follow line and add your base64 string
         Replace 'nil' with 'httpHeaders' in headers
         */
        
//        let httpHeaders: HTTPHeaders = [
//            "Authorization": "Basic MY_BASIC_AUTH_STRING"
//        ]
        
        AF.request("https://reqres.in/api/users/2", method: .put, parameters: params, headers: nil).validate(statusCode: 200 ..< 299).responseData { response in
            switch response.result {
                case .success(let data):
                    do {
                        guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                            print("Error: Cannot convert data to JSON object")
                            return
                        }
                        guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                            print("Error: Cannot convert JSON object to Pretty JSON data")
                            return
                        }
                        guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                            print("Error: Could print JSON in String")
                            return
                        }
                        print(prettyPrintedJson)
                        self.openDetailsVC(jsonString: prettyPrintedJson, title: "PUT METHOD")
                    } catch {
                        print("Error: Trying to convert JSON data to string")
                        return
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    func deleteMethod() {
        /*
         If the server uses consumer key and consumer secret, uncomment the follow lines and replace 'nil' with 'params' in parameters
         */
//        let params: Parameters = [
//            "consumer_key": "MY_CONSUMER_KEY",
//            "consumer_secret": "MY_CONSUMER_SECRET"
//        ]
        
        /*
         If you are using Basic Authentication uncomment the follow line and add your base64 string
         Replace 'nil' with 'httpHeaders' in headers
         */
        
//        let httpHeaders: HTTPHeaders = [
//            "Authorization": "Basic MY_BASIC_AUTH_STRING"
//        ]
        
        AF.request("https://my-json-server.typicode.com/typicode/demo/posts/1", method: .delete, parameters: nil, headers: nil).validate(statusCode: 200 ..< 299).responseData { response in
            switch response.result {
                case .success(let data):
                    do {
                        guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                            print("Error: Cannot convert data to JSON object")
                            return
                        }
                        guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                            print("Error: Cannot convert JSON object to Pretty JSON data")
                            return
                        }
                        guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                            print("Error: Could print JSON in String")
                            return
                        }

                        self.openDetailsVC(jsonString: prettyPrintedJson, title: "DELETE METHOD")
                    } catch {
                        print("Error: Trying to convert JSON data to string")
                        return
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    func openDetailsVC(jsonString: String, title: String) {
        detailsVCPrintedJson = jsonString
        detailsVCTitle = title
        
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "detailsseg", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "detailsseg" {
            let destViewController = segue.destination as? DetailsViewController
            destViewController?.title = detailsVCTitle
            destViewController?.jsonResults = detailsVCPrintedJson ?? ""
        }
    }
}
