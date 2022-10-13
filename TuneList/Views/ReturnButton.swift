//
//  ReturnButton.swift
//  TuneList
//
//  Created by Marc-Developer on 10/13/22.
//

import SwiftUI

struct ReturnButton: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        Button {
            isPresented = false
        } label: {
            Text("Return")
                .frame(maxWidth: .infinity, minHeight: 44)
                .background(Color("sky.blue"))
                .tint(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .padding()
    }
}

//struct ReturnButton_Previews: PreviewProvider {
//    static var previews: some View {
//        ReturnButton()
//    }
//}
