//
//  ContentView.swift
//  language
//
//  Created by Mikhail Chudaev on 14.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State var selected = 1
    
    @ObservedObject var listViewModel = ListViewModel()
    @ObservedObject var linkViewModel = LinkViewModel()
    
    var body: some View {
        ZStack {
            TabView(selection: $selected) {
                ListView()
                    .environmentObject(listViewModel)
                    .padding(.horizontal, 15)
                    .tag(1)
                    .tabItem {
                        VStack {
                            Image(systemName: "list.dash")
                            Text("List")
                        }
                    }
                RandomWordView()
                    .padding(.horizontal, 15)
                    .tag(2)
                    .tabItem {
                        VStack {
                            Image(systemName: "textformat.abc")
                            Text("Word")
                        }
                    }
                LinksView()
                    .environmentObject(linkViewModel)
                    .padding(.horizontal, 15)
                    .tag(3)
                    .tabItem {
                        VStack {
                            Image(systemName: "link")
                            Text("Link")
                        }
                    }
            }
            
            if listViewModel.isShowAddView {
                AddNewWordView()
                    .environmentObject(listViewModel)
            }
            if linkViewModel.isShowAddLink {
                AddNewLinkView()
                    .environmentObject(linkViewModel)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
