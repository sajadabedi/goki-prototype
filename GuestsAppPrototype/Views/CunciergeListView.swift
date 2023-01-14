//
//  CunciergeListView.swift
//  GuestsAppPrototype
//
//  Created by Sajad Abedi on 14.01.2023.
//

import SwiftUI


var cuncierges: [Cuncierge] = [
    .init(title: "Extend stay", description: "Request to stay longer", icon:"calendar.badge.plus"),
    .init(title: "Wi-fi", description: "Join the guest Wi-Fi", icon:"wifi"),
    .init(title: "Share access", description: "Share your keys with your family", icon:"person.2.fill"),
    .init(title: "Rent a Bike", description: "Less then 5min with great price", icon:"bicycle"),
]

struct CunciergeListView: View {
    var body: some View {
        VStack(alignment:.leading){
            Text("Concierge")
                .font(.title3)
                .bold()
                .padding(.bottom)
            VStack(spacing: 12){
                ForEach(cuncierges, id: \.title) { cuncierge in
                    HStack(alignment:.top){
                        Image(systemName: cuncierge.icon).frame(width: 32)
                        VStack(alignment: .leading){
                            Text(cuncierge.title)
                                .bold()
                            Text(cuncierge.description)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }.frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            
        }.padding(.horizontal, 20)
    }
}

struct Cuncierge {
    let title: String
    let description: String
    let icon: String
}

struct CunciergeListView_Previews: PreviewProvider {
    static var previews: some View {
        CunciergeListView()
    }
}
