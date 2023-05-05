//
//  ApiResponse.swift
//  mydesignpatternapp
//
//  Created by enigma 1 on 5/5/23.
//

import Foundation


enum DataState<Data,ErrorType ,Message> {
    
    case success(data: Data,message: Message)
    case error(error: ErrorType, message: Message)
    case loading(message: Message)
    case idle(message: Message)
    
}

