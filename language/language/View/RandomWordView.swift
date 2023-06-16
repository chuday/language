//
//  RandomWordView.swift
//  language
//
//  Created by Mikhail Chudaev on 14.06.2023.
//

import SwiftUI
import RealmSwift

struct RandomWordView: View {
    
    @State var isShowTranslate = false
    @State var word = WordItem()
    @State var offsetX: CGFloat = 0
    @State var opacity: CGFloat = 1
    
    @ObservedResults(WordItem.self) var wordItems
    
    var body: some View {
        
        ZStack {
            VStack {
                Spacer()
                VStack(spacing: 23) {
                    VStack(alignment: .leading) {
                        Text("TR")
                            .font(.system(size: 12, weight: .black))
                            .padding(.bottom, 0)
                        Text(word.mainWord)
                            .font(.system(size: 36, weight: .black))
                    }
                    
                    ZStack {
                        Text(word.wordTranslate)
                            .font(.system(size: 26, weight: .thin))
                            .opacity(isShowTranslate ? 1 : 0)
                        
                        Button {
                            isShowTranslate.toggle()
                        } label: {
                            Text("Show")
                                .padding(.vertical, 13)
                                .padding(.horizontal, 60)
                            
                                .foregroundColor(.white)
                                .background(.green)
                                .clipShape(Capsule())
                        }
                        .opacity(isShowTranslate ? 0 : 1)
                    }
                }
                .opacity(opacity)
                .offset(x: offsetX)
                Spacer()
                Button {
                    withAnimation {
                        offsetX = -50
                        opacity = 0
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                        getRandomWord()
                        offsetX = 50
                        isShowTranslate = false
                        
                        withAnimation {
                            offsetX = 0
                            opacity = 1
                        }
                    }
                } label: {
                    HStack {
                        Text("Next")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(.green)
                }
                
                Rectangle()
                    .frame(height: 28)
                    .opacity(0)
            }
            .frame(maxWidth: .infinity)
            .onAppear {
                getRandomWord()
            }
        }
    }
    
    func getRandomWord() {
        let random = Int.random(in: 0...wordItems.count - 1)
        self.word = wordItems[random]
    }
}

struct RandomWordView_Previews: PreviewProvider {
    static var previews: some View {
        RandomWordView()
    }
}
