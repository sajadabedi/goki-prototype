//
//  SmartKeyView.swift
//  GuestsAppPrototype
//
//  Created by Sajad Abedi on 07.01.2023.
//

import SwiftUI

struct SmartKeyButtonView: View {
    
    let iconName: String
    let label: String
    
    var body: some View {
        let  minWidthContainer: CGFloat = 85
        
        Button(action: {
            // action
        }, label: {
            VStack(alignment: .leading, spacing:20){
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color("ReverseLight"))
                    .shadow(color: .black.opacity(0.15), radius: 1,y: 1.4)
                    .overlay {
                        Image(systemName: iconName)
                            .bold()
                            .foregroundColor(.accentColor)
                    }
                Text(label)
                    .font(.subheadline)
                    .minimumScaleFactor(0.8)
                    .bold()
                    .foregroundColor(.primary)
                    .frame(maxWidth: minWidthContainer, alignment: .leading)
            }
        })
        .frame(minWidth: minWidthContainer, alignment: .leading)
        .padding(12)
        .background(Color("Gray4"))
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
        
    }
}

struct SmartKeyView_Previews: PreviewProvider {
    static var previews: some View {
        SmartKeyButtonView(iconName: "bed.double.fill", label: "Room")
    }
}
