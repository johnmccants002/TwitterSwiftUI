//
//  SearchViewModel.swift
//  TwitterSwiftUI
//
//  Created by John McCants on 7/6/22.
//

import Foundation
import SwiftUI
import Firebase

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments {
            snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            self.users = documents.map({ User(dict: $0.data() )})
            
        }
    }
}
