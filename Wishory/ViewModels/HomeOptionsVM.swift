//
//  HomeOptionsVM.swift
//  Wishory
//
//  Created by Mostafa Sayed on 30/10/2024.
//
import Foundation

class HomeOptionsVM: ObservableObject {
    @Published var optionsVM: [HomeOptionVM] = []
    
    func getOptions() async {
        optionsVM = HomeOption.testValues().map {HomeOptionVM(option: $0)}
    }
}
