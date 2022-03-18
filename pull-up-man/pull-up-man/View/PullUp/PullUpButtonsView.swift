//
//  PullUpButtonsView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/18.
//

import SwiftUI

struct PullUpButtonsView: View {
    
    var body: some View {
        VStack {
            HStack {
                minusButton
                plusButton
            }
            .padding()
            Button(action: {
                
            }) {
                Text("Finish Set")
            }
            .frame(width: 230, height: 45)
            .font(.system(size: 18))
            .foregroundColor(Color.white)
            .background(Color.myGreen)
            .cornerRadius(6.0)
        }
        
    }
    
    var plusButton: some View {
        Button(action: {
            
        }) {
            Image(systemName: "plus")
        }
        .frame(width: 115, height: 45)
        .font(.system(size: 30))
        .foregroundColor(Color.white)
        .background(Color.myGreen)
        .cornerRadius(6.0)
    }
    
    var minusButton: some View {
        Button(action: {
            
        }) {
            Image(systemName: "minus")
        }
        .frame(width: 115, height: 45)
        .font(.system(size: 30))
        .foregroundColor(Color.white)
        .background(Color.red)
        .cornerRadius(6.0)
    }
}

struct PullUpButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        PullUpButtonsView()
    }
}
