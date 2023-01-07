//
//  Chips.swift
//  GuestsAppPrototype
//
//  Created by Sajad Abedi on 07.01.2023.
//

import SwiftUI

struct Chips: View {
    
    let label: String
    
    var body: some View {
        HStack {
            Text(label)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .font(.subheadline)
                .bold()
        }
        .background(.ultraThinMaterial)
        .cornerRadius(.infinity)
    }
}

struct Chips_Previews: PreviewProvider {
    static var previews: some View {
        Chips(label: "WIFI")
    }
}
