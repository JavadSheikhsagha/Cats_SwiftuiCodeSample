//
//  ErrorType.swift
//  mydesignpatternapp
//
//  Created by enigma 1 on 5/5/23.
//

import Foundation




enum ErrorType : Error {
    
    case httpError(HTTPCode?)
    case unknown
    case parseError(String)
}


typealias HTTPCode = Int
