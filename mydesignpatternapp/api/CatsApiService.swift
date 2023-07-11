//
//  ApiService.swift
//  mydesignpatternapp
//
//  Created by enigma 1 on 5/5/23.
//

import Foundation
import Alamofire
import SwiftyJSON


protocol CatsApiService {
    
    
    func fetchFactsAboutCats(onResponse : @escaping (DataState<[FactModel]?, ErrorType?, String?>) -> Void)
    
    func fetchFactsAboutCats() async throws -> DataState<[FactModel]?, ErrorType?, String?>
    
}


class CatsApiService_Impl: CatsApiService {
    
    
    func fetchFactsAboutCats(onResponse: @escaping (DataState<[FactModel]?, ErrorType?, String?>) -> Void) {
        let link = "\(BASE_URL)facts"
        print("data fetch ")
        onResponse(.loading(message: ""))
        AF.request(link, method: .get, encoding: JSONEncoding.default).responseJSON { (response) in
            
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                print(json)
                
                let data = MyDecoder<[FactModel]>().decodeJSON(json: response.data!)
                
                switch data {
                    case .success(let data):
                    onResponse(DataState.success(data: data, message: ""))
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
    
    
    func fetchFactsAboutCats() async -> DataState<[FactModel]?, ErrorType?, String?>  {
        
        do {
            
            let (data, _) = try await URLSession.shared.data(from: URL(string: "\(BASE_URL)facts")!)
    
            let parsedData = MyDecoder<[FactModel]>().decodeJSON(json: data)
            
            switch (parsedData) {
            case .success(let list):
                return DataState.success(data: list)
            case .failure(let error):
                return DataState.error(error: ErrorType.parseError(error?.localizedDescription ?? "Failed to parse json"), message: "")
            }
        }catch {
            return DataState.error(error: ErrorType.httpError(error.asAFError?.responseCode))
        }
    }
    
}
