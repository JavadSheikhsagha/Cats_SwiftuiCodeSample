//
//  CatViewModel.swift
//  mydesignpatternapp
//
//  Created by enigma 1 on 5/5/23.
//

import Foundation


class CatViewModel : ObservableObject {
    
    
    @Published var cats : [FactModel] = []
    @Published var sortedCats : [FactModel] = []
//    @Published var cats : DataState<[FactModel], ErrorType, String> = .idle(message: "")
//    @Published var sortedCats : DataState<[FactModel], ErrorType, String> = .idle(message: "")
    
    
    
    private var catRepository : CatRepository?
    
    
    init() {
        self.catRepository = CatRepository()
    }
    
    
    func getCatList(onRecievedData: @escaping (DataState<[FactModel]?, ErrorType?, String?>) -> Void) {
        
        onRecievedData(DataState.loading(message: ""))
        
        self.catRepository?.getAllCats(onRecievedData: { dataState in
            
            switch dataState {
            case .success(let data, let message):
                
                self.sortedCats = data?.sorted(by: { f1, f2 in
                    return f1.text?.count ?? 0 > f2.text?.count ?? 0
                }) ?? []
                print("data came ")
                onRecievedData(DataState.success(data: self.sortedCats, message: message))
                break
            case .error(let error, let message):
                print("data error ")
                onRecievedData(DataState.error(error: error, message: message))
                break
            case .loading(let message):
                print("data loading ")
                onRecievedData(DataState.loading(message: message))
                break
            case .idle(let message):
                print("data idle ")
                onRecievedData(DataState.idle(message: message))
                break
            }
            
        })
    }
    
    
}
