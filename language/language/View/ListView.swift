//
//  ListView.swift
//  language
//
//  Created by Mikhail Chudaev on 14.06.2023.
//

import SwiftUI

struct ListView: View {
    
    @State var searchText = ""
    @EnvironmentObject var listViewModel: ListViewModel
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 25) {
                    HStack(spacing: 8) {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 15, height: 15)
                        TextField("Search", text: $searchText)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .padding(.horizontal, 20)
                    .background(Color.gray)
                    .cornerRadius(10)
                    
                    VStack(spacing: 20) {
                        CardItem()
                        CardItem()
                        CardItem()
                    }
                }
            }
            
            Button {
                listViewModel.isShowAddView.toggle()
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 56, height: 56)
                        .foregroundColor(.green)
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                }
            }
            .offset(x: -20, y: -30)
        }
    }
}

struct CardItem: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading, spacing: 0) {
                Text("A")
                    .font(.system(size: 12, weight: .black))
                    .padding(.bottom, 5)
                Text("B")
                    .font(.system(size: 18, weight: .black))
                Rectangle()
                    .frame(height: 7)
                    .opacity(0)
                Text("C")
                    .font(.system(size: 18, weight: .light))
            }
            
            Divider()
            VStack(alignment: .leading) {
                Text("BBB")
                    .font(.system(size: 12, weight: .black))
                    .padding(.bottom, 2)
                    .foregroundColor(.secondary)
                Text("XXX")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(.gray)
        .cornerRadius(10)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
