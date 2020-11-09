//
//  ProfileViewModel.swift
//  MVVM Basics
//
//  Created by Rajnish Raj on 02/11/20.
//

import Foundation

struct ProfileViewModel {
    
    var id: Int
    var firstName: String
    var image: String
    
    
    static func fetchData() -> [ProfileViewModel]? {
        guard let filePath = Bundle.main.path(forResource: "Data", ofType: "json") else { return nil }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath:  filePath), options: .mappedIfSafe)
            let users = try JSONDecoder().decode([User].self, from: data)
            return users.map({ProfileViewModel(id: $0.id, firstName: $0.firstName, image: $0.image)})
        } catch {
            print(error)
            return nil
        }
    }
}

