//
//  LongPressGesture.swift
//  superSwiftUI
//
//  Created by Sukhmani Kaur on 17/12/22.
//

import SwiftUI

struct LongPressGesture: View {
    
    @State var isComplete: Bool = Bool()
    @State var isSuccess: Bool = Bool()
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(isSuccess ? .green : .blue)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.gray)
            
            HStack {
                Text("CLICK HERE")
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                .cornerRadius(10)
                .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50, pressing: { isPressing in
                    // start of press -> min duration
                    if isPressing {
                        withAnimation(.easeInOut(duration: 1.0)) {
                            isComplete = true
                        }
                    }
                    else {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            if !isSuccess {
                                withAnimation(.easeInOut) {
                                    isComplete = false
                                }
                            }
                        }
                    }
                }, perform: {
                    // at the min duration
                    withAnimation(.easeInOut) {
                        isSuccess = true
                    }
                })

                Text("RESET")
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                .cornerRadius(10)
                .onTapGesture {
                    isComplete = false
                    isSuccess = false
                }
            }
        }
    }
}

struct LongPressGesture_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGesture()
    }
}
