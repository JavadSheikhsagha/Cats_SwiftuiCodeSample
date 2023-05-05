//
//  ContentView.swift
//  mydesignpatternapp
//
//  Created by enigma 1 on 5/5/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var catData : [FactModel] = []
    
    @State var errorMessage : String? = nil
    @State var showError : Bool = false
    
    @State var showLoading : Bool = false
    
    @StateObject var catViewModel = CatViewModel()
    
    var body: some View {
        ZStack {
            
            Color.red
                .opacity(0.1)
                .ignoresSafeArea()
            
            
            
            VStack {
                ForEach(catData, id: \._id) { data in
                    
                    Text(data.text ?? "nil")
                    
                }
            }
            .padding()
            
            ProgressView()
                .opacity(showLoading ? 1.0 : 0.0)
            
        }
        .alert("Error", isPresented: $showError, actions: {
            Button {
                errorMessage = nil
            } label: {
                Text("ok")
            }

        }, message: {
            Text(errorMessage ?? "")
        }).onAppear {
            
            print("data fetch ")
            
            getCatData()
        }
    }
    
    
    func getCatData() {
        catViewModel.getCatList { data in
            switch data {
            case .success(let data,_):
                catData = data ?? []
                showLoading = false
                break
            case .error(_,let message):
                errorMessage = message
                showError = true
                showLoading = false
                break
            case .loading(_):
                showLoading = true
                break
            case .idle(_):
                catData = []
                break
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
