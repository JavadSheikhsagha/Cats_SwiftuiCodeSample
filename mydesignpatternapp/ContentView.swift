//
//  ContentView.swift
//  mydesignpatternapp
//
//  Created by enigma 1 on 5/5/23.
//

import SwiftUI

struct ContentView: View {
    
    
    @StateObject var catViewModel = CatViewModel()
    
    var body: some View {
        ZStack {
            
            Color.red
                .opacity(0.1)
                .ignoresSafeArea()
            
            
            
            VStack {
                ForEach(catViewModel.sortedCats, id: \._id) { data in
                    
                    Text(data.text ?? "nil")
                    
                }
            }
            .padding()
            
            ProgressView()
                .opacity(catViewModel.showLoading ? 1.0 : 0.0)
            
        }
        .alert("Error", isPresented: $catViewModel.showError, actions: {
            Button {
                catViewModel.errorMessage = nil
            } label: {
                Text("ok")
            }

        }, message: {
            Text(catViewModel.errorMessage ?? "")
        }).onAppear {
            
//            print("data fetch ")
//            getCatData()
            
        }.task {
            await catViewModel.getCatFactsWithAsync()
        }
    }
    
    
    func getCatData() {
        catViewModel.getCatList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
