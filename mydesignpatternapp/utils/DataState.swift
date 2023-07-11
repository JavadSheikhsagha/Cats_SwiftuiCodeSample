//
//  ApiResponse.swift
//  mydesignpatternapp
//
//  Created by enigma 1 on 5/5/23.
//

import Foundation


enum DataState<Data,ErrorType ,Message> {
    
    case success(data: Data,message: Message? = nil)
    case error(error: ErrorType, message: Message? = nil)
    case loading(message: Message? = nil)
    case idle(message: Message? = nil)
    
}

