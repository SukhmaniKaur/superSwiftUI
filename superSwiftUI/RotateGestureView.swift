//
//  RotateGestureView.swift
//  superSwiftUI
//
//  Created by Sukhmani Kaur on 17/12/22.
//

import SwiftUI

struct RotateGestureView: View {
    
    @State var currentAngle: Angle = Angle(degrees: 0)
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding(50)
            .background(.red)
            .cornerRadius(10)
            .rotationEffect(currentAngle)
            .gesture(
                RotationGesture()
                    .onChanged { value in
                        currentAngle = value
                    }
                    .onEnded { value in
                        withAnimation(.spring()) {
                            currentAngle = Angle(degrees: 0)
                        }
                    }
            )
    }
}

struct RotateGestureView_Previews: PreviewProvider {
    static var previews: some View {
        RotateGestureView()
    }
}
