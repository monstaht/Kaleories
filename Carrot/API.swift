//
//  API.swift
//  Chatroom
//
//  Created by Lucas Derraugh on 4/17/16.
//  Copyright © 2016 Lucas Derraugh. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

private enum Router: URLStringConvertible {
    case GetSuggestions
    case ConfirmFood
    case GetDay(String)
    case GetAllPics
    
    var URLString: String {
        let endValue: String = {
            switch self {
            case .GetSuggestions:
                print("attempting to request getSuggestions")
                return "get_suggestions"
            case .ConfirmFood:
                return "confirmFood"
            case .GetDay(let day):
                return "getDay/\(day)"
            case .GetAllPics:
                return "allPictures"
            }
        }()
        //return "http://10.128.23.86:5000/\(endValue)"
        return "http://kalories.azurewebsites.net/\(endValue)"
    }
}

class API {
    static let sharedInstance = API()
    
    static func getFullURL(urlshort: [(String, Int)]) -> [(String, Int)]{
        let start = "http://kalories.azurewebsites.net"
    //    let start = "http://10.128.23.86:5000"
        return urlshort.map({ (start + $0, $1) })
    }
    
    // define a function called map that returns a JSON object from a list [String: AnyObject]
    let map: [String: AnyObject] -> JSON = {
        let json = JSON($0)
        print(json)
        return json
    }
    
    func getSuggestions(picture: String, completion: ([String],String) -> Void) {
        let map: [String: AnyObject] -> ([String],String) = {
            print($0)
            return (JSON($0)["suggestions"].arrayValue.map { String($0) }, JSON($0)["url"].stringValue)
        }
        print(picture)
        post(.GetSuggestions, params: ["base_id":picture], map: map, completion: completion)
    }
    
    
    // format of confirmedjson is ["content": [["pizza", 5], ["fries", 6]], "url": "urlstring"]
    func confirmFood(confirmedjson: [String: AnyObject], completion: (Nutrition,String) -> Void) {
        let map: [String: AnyObject] -> (Nutrition,String) = {
            print(JSON($0)["food"])
            let nutrition = Nutrition(json: JSON(JSON($0)["food"].dictionaryValue), healthy: JSON($0)["healthy"].boolValue, vitamins: JSON($0)["vitamins"].arrayValue.map({$0.stringValue}))
            let url = JSON($0)["url"].stringValue
            return (nutrition, url)
        }
        print("posting to confirmFood")
        post(.ConfirmFood, params: confirmedjson, map: map, completion: completion)
    }
    
    //Day string is in the format DDMMYY string of integers
    func getDay(day: String, completion: [String: AnyObject] -> Void) {
        let map: [String: AnyObject] -> [String: AnyObject] = {l in
            return l
        }
        get(.GetDay(day), params: [:], map: map, completion: completion)
    }
    
    func getAllPics(completion: [(String, Int)] -> Void) {
        let map: [String: AnyObject] -> [(String, Int)] = {
            print(API.getFullURL((JSON($0)["urlAndDate"].arrayValue.map { ($0.arrayValue[0].stringValue, $0.arrayValue[1].int!) })))
            return API.getFullURL(JSON($0)["urlAndDate"].arrayValue.map { ($0.arrayValue[0].stringValue, $0.arrayValue[1].int!) })
        }
        get(.GetAllPics, params: [:], map: map, completion: completion)
    }
    
    private func post<O, T>(router: Router, params: [String: AnyObject], map: O -> T?, completion: (T -> Void)? = nil) {
        makeNetworkRequest(.POST, router: router, params: params, map: map, completion: completion)
    }
    
    private func get<O, T>(router: Router, params: [String: AnyObject], map: O -> T?, completion: (T -> Void)? = nil) {
        makeNetworkRequest(.GET, router: router, params: params, map: map, completion: completion)
    }
    
    private func makeNetworkRequest<O, T>(method: Alamofire.Method, router: Router, params: [String: AnyObject], map: O -> T?, completion: (T -> Void)?) {
        let encoding: ParameterEncoding = method == .GET ? .URL : .JSON
        Alamofire
            .request(method, router, parameters: params, encoding: encoding)
            .responseJSON { response in
                if let json = response.result.value as? O {
                    if let obj = map(json) {
                        completion?(obj)
                    } else {
                        print("Error on mapping \(json) from \(O.self) to \(T.self)")
                    }
                } else if let error = response.result.error {
                    print(error)
                }
        }
    }
}