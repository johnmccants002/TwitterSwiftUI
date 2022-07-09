//
//  SearchView.swift
//  TwitterSwiftUI
//
//  Created by John McCants on 6/27/22.
//

import SwiftUI


struct SearchView: View {
    @State var searchText = ""
    @ObservedObject var viewModel = SearchViewModel()
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding()
            VStack(alignment: .leading) {
                ForEach(viewModel.users) { user in
                    HStack { Spacer() }
                    
                    NavigationLink {
                        UserProfileView(user: user)
                    } label: {
                        UserCell(user: user)
                    }
                    
                }
            }.padding(.leading)
        }
        .navigationBarTitle("Search")
        .navigationBarTitleDisplayMode(.inline)
        
        
    }
        
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
