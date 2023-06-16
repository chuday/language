//
//  AddNewWordView.swift
//  language
//
//  Created by Mikhail Chudaev on 14.06.2023.
//

import SwiftUI
import RealmSwift

struct AddNewWordView: View {
    
    @State var newWord = ""
    @State var wordTranslate = ""
    @State var wordDescription = ""
    @State var showAlert = false
    
    @EnvironmentObject var listViewModel: ListViewModel
    @ObservedResults(WordItem.self) var wordItems
    
    var body: some View {
        
        VStack {
            HStack {
                Spacer()
                Text("New word")
                    .font(.system(size: 20,  weight: .black))
                    .padding(.leading, 16)
                Spacer()
                Button {
                    listViewModel.isShowAddView.toggle()
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundColor(.black)
                }
            }
            
            VStack(alignment: .leading) {
                Text("TR")
                    .font(.system(size: 12, weight: .black))
                HStack {
                    TextField("Word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                .padding(.vertical, 13)
                .padding(.horizontal, 23)
                .background(.gray)
                .cornerRadius(10)
                
                HStack {
                    TextField("Translate", text: $wordTranslate)
                }
                .padding(.vertical, 13)
                .padding(.horizontal, 23)
                .background(.gray)
                .cornerRadius(10)
                
                Text("Description")
                    .font(.system(size: 14, weight: .black))
                    .padding(.top, 23)
                    .padding(.leading, 23)
                
                HStack {
                    TextEditor(text: $wordDescription)
                        .frame(height: 90)
                        .colorMultiply(.gray)
                }
                .padding(.vertical, 13)
                .padding(.horizontal, 23)
                .background(.gray)
            }
            Spacer()
            Button {
                if newWord.count == 0 || wordTranslate.count == 0 {
                    showAlert.toggle()
                } else {
                    let word = WordItem()
                    word.mainWord = newWord
                    word.wordDescription = wordDescription
                    word.wordTranslate = wordTranslate
                    
                    $wordItems.append(word)
                    
                    withAnimation {
                        listViewModel.isShowAddView.toggle()
                    }
                }
            } label: {
                Text("Save")
                    .padding(.vertical, 13)
                    .frame(maxWidth: .infinity)
                    .background(.green)
                    .clipShape(Capsule())
            }
            .alert(Text("Empty"), isPresented: $showAlert, actions: {})
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(15)
        .background(.white)
    }
}

struct AddNewWordView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewWordView()
    }
}
