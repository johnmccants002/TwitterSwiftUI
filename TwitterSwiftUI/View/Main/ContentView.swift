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
    @State var selection = 0
    let titles = ["Home", "Search", "Messages"]
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                NavigationView {
                    
                    TabView(selection: $selection) {
                        FeedView()
                            .tabItem {
                                Image(systemName: "house")
                                Text("Home")
                            }.tag(0)
                    
                        SearchView()
                            .tabItem {
                                Image(systemName: "magnifyingglass")
                                Text("Search")
                            }.tag(1)
              
                        ConversationsView()
                            .tabItem {
                                Image(systemName: "envelope")
                                Text("Messages")
                            }.tag(2)
                      
                    }
                    .navigationTitle(titles[selection])
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
