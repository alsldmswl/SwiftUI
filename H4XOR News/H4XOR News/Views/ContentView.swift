//
//  ContentView.swift
//  H4XOR News
//
//  Created by eun-ji on 2023/04/19.
//

import SwiftUI

struct ContentView: View {
    
    //구독
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                
                
            }
            .navigationBarTitle("H4XOR NEWS")
        }
        .onAppear { // like viewDidLoad
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//
//let posts = [
//    Post(id: "1", title: "hello"),
//    Post(id: "2", title: "bonjour"),
//    Post(id: "3", title: "hola")
//]
