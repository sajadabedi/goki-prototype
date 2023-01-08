//
//  FabButton.swift
//  GuestsAppPrototype
//
//  Created by Sajad Abedi on 08.01.2023.
//

import SwiftUI

struct FabButton: View {
    var body: some View {
        Button {
            //action
        } label: {
            Circle()
                .frame(width: 60, height: 60)
                .shadow(color: .black.opacity(0.2), radius: 8,y: 8)
                .overlay {
                    Image(systemName: "message.fill")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.white)
                }
        }
    }
}

struct FabButton_Previews: PreviewProvider {
    static var previews: some View {
        FabButton()
    }
}
