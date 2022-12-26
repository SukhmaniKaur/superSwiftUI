//
//  ScrollViewReaderExample.swift
//  superSwiftUI
//
//  Created by Sukhmani Kaur on 26/12/22.
//

import SwiftUI

struct ScrollViewReaderExample: View {
    
    @State var textfieldValue: String = String()
    @State var scrollToIndex: Int = Int()
    
    var body: some View {
        VStack {
            TextField("Type the index here...", text: $textfieldValue)
                .keyboardType(.numberPad)
                .frame(height: 55)
                .border(.gray)
                .padding(.horizontal)

            Button("SCROLL NOW") {
                if let index = Int(textfieldValue) {
                    scrollToIndex = index
                }
            }
            
            ScrollView {
                ScrollViewReader { proxy in
                    ForEach(0..<50) { index in
                        Text("This is item #\(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                    }
                    .onChange(of: scrollToIndex) { newValue in
                        withAnimation(.spring()) {
                            proxy.scrollTo(newValue, anchor: .center)
                        }
                    }
                }
            }
        }
    }
}

struct ScrollViewReaderExample_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReaderExample()
    }
}
