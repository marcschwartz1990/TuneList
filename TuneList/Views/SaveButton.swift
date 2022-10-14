//
//  ReturnButton.swift
//  TuneList
//
//  Created by Marc-Developer on 10/13/22.
//

import SwiftUI

struct SaveButton: View {
    @Binding var isPresented: Bool
    
    let action: () -> Void
    
    var body: some View {
        Button {
            isPresented = false
            action()
        } label: {
            Text("Save")
                .frame(maxWidth: .infinity, minHeight: 44)
                .background(Color("blue"))
                .tint(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .padding()
    }
}

//struct SaveButton_Previews: PreviewProvider {
//    static var previews: some View {
//        SaveButton()
//    }
//}
