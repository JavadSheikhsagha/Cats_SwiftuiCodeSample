//
//  CatViewModel.swift
//  mydesignpatternapp
//
//  Created by enigma 1 on 5/5/23.
//

import Foundation
import SwiftUI


class CatViewModel : ObservableObject {
    
    
//    @Published var cats : [FactModel] = []
    @Published var sortedCats : [FactModel] = []
    @Published var errorMessage : String? = nil
    @Published var showError : Bool = false
    @Published var showLoading : Bool = false
//    @Published var cats : DataState<[FactModel], ErrorType, String> = .idle(message: "")
//    @Published var sortedCats : DataState<[FactModel], ErrorType, String> = .idle(message: "")
    
    
    
    private var catRepository : CatRepository?
    
    
    init() {
        self.catRepository = CatRepository()
    }
    
    
    func getCatList() {
        
        self.catRepository?.getAllCats(onRecievedData: { dataState in
            
            switch dataState {
            case .success(let data, _):
                
                self.sortedCats = data?.sorted(by: { f1, f2 in
                    return f1.text?.count ?? 0 > f2.text?.count ?? 0
                }) ?? []
                print("data came ")
                self.showLoading = false
                break
            case .error(let error,_):
                var msg = ""
                switch error {
                    case .unknown:
                        msg = "Unknown Error"
                        break
                    case .httpError(_):
                        msg = "No Internet Connection"
                        break
                    case .parseError(_):
                        msg = "Failed to connect to server"
                        break
                    case .none:
                        msg = "Something went wrong"
                        break
                }
                print("data error ")
                self.errorMessage = msg
                self.showError = true
                self.showLoading = false
                
                break
            case .loading(_):
                print("data loading ")
                self.showLoading = true
                break
            case .idle(_):
                print("data idle ")
                
                break
            }
            
        })
    }
    
    
}
