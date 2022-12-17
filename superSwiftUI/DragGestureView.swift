//
//  DragGestureView.swift
//  superSwiftUI
//
//  Created by Sukhmani Kaur on 17/12/22.
//

import SwiftUI

struct DragGestureView: View {
    
    @State var offsetfrom: CGSize = .zero
    
    var body: some View {
        ZStack {
            VStack {
                Text("\(offsetfrom.width)")
                Spacer()
            }
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300, height: 500)
                .offset(offsetfrom)
                .scaleEffect(getScaleOffset())
                .rotationEffect(Angle(degrees: getRotationAmount()))
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.spring()) {
                                offsetfrom = value.translation
                            }
                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                                offsetfrom = .zero
                            }
                        }
                )
        }
    }
    
    func getScaleOffset() -> CGFloat {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = abs(offsetfrom.width)
        let percentage = currentAmount / max
        return 1.0 - min(percentage, 0.5) * 0.5
    }
    
    func getRotationAmount() -> Double {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = offsetfrom.width
        let percentage = Double(currentAmount / max)
        let maxAngle: Double = 10
        return percentage * maxAngle
    }
}

struct DragGestureView_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureView()
    }
}
