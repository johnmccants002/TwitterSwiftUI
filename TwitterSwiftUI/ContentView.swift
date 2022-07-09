//
//  ContentView.swift
//  TwitterSwiftUI
//
//  Created by John McCants on 6/27/22.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                NavigationView {
                    
                    TabView {
                        FeedView()
                            .tabItem {
                                Image(systemName: "house")
                                Text("Home")
                            }
                        SearchView()
                            .tabItem {
                                Image(systemName: "magnifyingglass")
                                Text("Search")
                            }
                        ConversationsView()
                            .tabItem {
                                Image(systemName: "envelope")
                                Text("Messages")
                            }
                    }
                    .navigationBarTitle("Home")
                    .navigationBarItems(leading: Button(action: {
                        viewModel.signout()
                    }, label: {
                        KFImage(URL(string: viewModel.user?.profileImageUrl ?? ""))
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(width: 32, height: 32)
                            .cornerRadius(16)
                    }))
                    .navigationBarTitleDisplayMode(.inline)
                }
                
            } else {
                LoginView()
            }
            
        }

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
