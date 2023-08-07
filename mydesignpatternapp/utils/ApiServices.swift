//
//  ApiServices.swift
//  mydesignpatternapp
//
//  Created by Javad on 8/1/23.
//

import Foundation
import Alamofire
import SwiftyJSON


class GetApiService<DataModel:Codable> {
    
    let url:String
    let header : [String:String]
    
    init(url:String, header:[String:String]?) {
        self.url = url
        if let header = header {
            self.header = header
        } else{
            self.header = [:]
        }
    }
    
    func fetch(onResponse: @escaping (DataState<DataModel?, ErrorType?, String?>) -> Void) {
        let link = "\(BASE_URL)facts"
        print("data fetch ")
        onResponse(.loading(message: ""))
        AF.request(link, method: .get, encoding: JSONEncoding.default,headers: HTTPHeaders(header))
            .responseJSON { (response) in
            
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                print(json)
                
                let data = MyDecoder<DataModel>().decodeJSON(json: response.data!)
                
                switch data {
                    case .success(let datamodel):
                    onResponse(DataState.success(data: datamodel, message: ""))
                    case .failure(let error):
                    print("failed to parse")
                    onResponse(DataState.error(error: ErrorType.parseError(error?.localizedDescription ?? "Failed to parse json"), message: ""))
                }
                
            case .failure(let error):
                print("failed to recieve, \(error.localizedDescription)")
                onResponse(DataState.error(error: ErrorType.httpError(error.responseCode), message: error.localizedDescription))
            }
            
        }
    }
}


class PostApiService<DataModel:Codable> {
    
    let url:String
    let header : [String:String]
    let parameters: [String:Any]?
    
    init(parameters: [String:Any]?,header:[String:String]?,url:String) {
        self.url = url
        if let header = header {
            self.header = header
        } else{
            self.header = [:]
        }
        self.parameters = parameters
    }
    
    func fetch(onResponse: @escaping (DataState<DataModel?, ErrorType?, String?>) -> Void) {
        let link = "\(BASE_URL)facts"
        print("data fetch ")
        onResponse(.loading(message: ""))
        AF.request(link, method: .post, parameters: parameters,encoding: JSONEncoding.default, headers: HTTPHeaders(header))
            .responseJSON { (response) in
            
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                print(json)
                
                let data = MyDecoder<DataModel>().decodeJSON(json: response.data!)
                
                switch data {
                    case .success(let datamodel):
                    onResponse(DataState.success(data: datamodel, message: ""))
                    case .failure(let error):
                    print("failed to parse")
                    onResponse(DataState.error(error: ErrorType.parseError(error?.localizedDescription ?? "Failed to parse json"), message: ""))
                }
                
            case .failure(let error):
                print("failed to recieve, \(error.localizedDescription)")
                onResponse(DataState.error(error: ErrorType.httpError(error.responseCode), message: error.localizedDescription))
            }
            
        }
    }
}

class DeleteApiService<DataModel:Codable> {
    
    let url:String
    let header : [String:String]
    let parameters: [String:Any]?
    
    init(parameters: [String:Any]?,header:[String:String]?,url:String) {
        self.url = url
        if let header = header {
            self.header = header
        } else{
            self.header = [:]
        }
        self.parameters = parameters
    }
    
    func fetch(onResponse: @escaping (DataState<DataModel?, ErrorType?, String?>) -> Void) {
        let link = "\(BASE_URL)facts"
        print("data fetch ")
        onResponse(.loading(message: ""))
        AF.request(link, method: .post, parameters: parameters,encoding: JSONEncoding.default, headers: HTTPHeaders(header))
            .responseJSON { (response) in
            
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                print(json)
                
                let data = MyDecoder<DataModel>().decodeJSON(json: response.data!)
                
                switch data {
                    case .success(let datamodel):
                    onResponse(DataState.success(data: datamodel, message: ""))
                    case .failure(let error):
                    print("failed to parse")
                    onResponse(DataState.error(error: ErrorType.parseError(error?.localizedDescription ?? "Failed to parse json"), message: ""))
                }
                
            case .failure(let error):
                print("failed to recieve, \(error.localizedDescription)")
                onResponse(DataState.error(error: ErrorType.httpError(error.responseCode), message: error.localizedDescription))
            }
            
        }
    }
}

class PatchApiService<DataModel:Codable> {
    
    let url:String
    let header : [String:String]
    let parameters: [String:Any]?
    
    init(parameters: [String:Any]?,header:[String:String]?,url:String) {
        self.url = url
        if let header = header {
            self.header = header
        } else{
            self.header = [:]
        }
        self.parameters = parameters
    }
    
    func fetch(onResponse: @escaping (DataState<DataModel?, ErrorType?, String?>) -> Void) {
        let link = "\(BASE_URL)facts"
        print("data fetch ")
        onResponse(.loading(message: ""))
        AF.request(link, method: .post, parameters: parameters,encoding: JSONEncoding.default, headers: HTTPHeaders(header))
            .responseJSON { (response) in
            
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                print(json)
                
                let data = MyDecoder<DataModel>().decodeJSON(json: response.data!)
                
                switch data {
                    case .success(let datamodel):
                    onResponse(DataState.success(data: datamodel, message: ""))
                    case .failure(let error):
                    print("failed to parse")
                    onResponse(DataState.error(error: ErrorType.parseError(error?.localizedDescription ?? "Failed to parse json"), message: ""))
                }
                
            case .failure(let error):
                print("failed to recieve, \(error.localizedDescription)")
                onResponse(DataState.error(error: ErrorType.httpError(error.responseCode), message: error.localizedDescription))
            }
            
        }
    }
}



class UploadImageApiService<DataModel:Codable> {
    
    let url:String
    let header : [String:String]
    let parameters: [String:Any]?
    
    init(parameters: [String:Any]?,header:[String:String]?,url:String) {
        self.url = url
        if let header = header {
            self.header = header
        } else{
            self.header = [:]
        }
        self.parameters = parameters
    }
    
    func fetchFactsAboutCats(onResponse: @escaping (DataState<DataModel?, ErrorType?, String?>,_ progress:Float) -> Void) {
        let link = "\(BASE_URL)facts"
        print("data fetch ")
        onResponse(.loading(message: ""),0)
        // todo add upload func
        
    }
}

