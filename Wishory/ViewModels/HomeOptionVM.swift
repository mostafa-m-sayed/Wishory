//
//  HomeOptionVM.swift
//  Wishory
//
//  Created by Mostafa Sayed on 30/10/2024.
//

struct HomeOptionVM: Identifiable {
    var option: HomeOption

    var id : Int {
        option.id
    }
    var title: String {
        option.title
    }
    init(option: HomeOption) {
        self.option = option
    }
    
}
