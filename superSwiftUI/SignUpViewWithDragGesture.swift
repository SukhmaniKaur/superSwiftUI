//
//  SignUpViewWithDragGesture.swift
//  superSwiftUI
//
//  Created by Sukhmani Kaur on 25/12/22.
//

import SwiftUI

struct SignUpViewWithDragGesture: View {
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Image(systemName: "chevron.up")
                Text("Sign up")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Image(systemName: "flame.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                
                Text("WebRTC(Web Real-Time Communication) is a set of technologies that is developed for peer to peer duplex real-time communication between browsers.")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Text("Create an account")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding()
                    .padding(.horizontal)
                    .background(.black).cornerRadius(10)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(.white)
            .cornerRadius(30)
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct SignUpViewWithDragGesture_Previews: PreviewProvider {
    static var previews: some View {
        SignUpViewWithDragGesture()
    }
}
