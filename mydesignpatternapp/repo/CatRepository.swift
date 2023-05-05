//
//  repository.swift
//  mydesignpatternapp
//
//  Created by enigma 1 on 5/5/23.
//

import Foundation


class CatRepository {
    
    
    private var catApiService : CatsApiService?
    
    
    init() {
        self.catApiService = CatsApiService_Impl()
        
    }
    
    
    
    // - - - Functions - >
    
    func getAllCats(onRecievedData : @escaping (DataState<[FactModel]?, ErrorType?, String?>) -> Void) {
        self.catApiService?.fetchFactsAboutCats(onResponse: onRecievedData)
    }
    
    
}
