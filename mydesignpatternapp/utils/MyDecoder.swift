//
//  MyDecoder.swift
//  mydesignpatternapp
//
//  Created by enigma 1 on 5/5/23.
//

import Foundation
import SwiftyJSON

enum MyDecoderState<Data , Error> {

    case success(Data)
    case failure(Error)
}


class MyDecoder<DataModel:Decodable> {
    
    func decodeJSON(json : Data) -> MyDecoderState<DataModel?, Error?> {
        do {
            let decoder = JSONDecoder()
            let data = try decoder.decode(DataModel.self, from: json)
            return MyDecoderState.success(data)
          } catch let jsonError as NSError {
              print("JSON decode failed: \(jsonError.description)")
              return MyDecoderState.failure(jsonError)
          }
    }
}
