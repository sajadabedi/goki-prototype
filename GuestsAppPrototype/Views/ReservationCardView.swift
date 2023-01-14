//
//  ReservationCardView.swift
//  GuestsAppPrototype
//
//  Created by Sajad Abedi on 14.01.2023.
//

import SwiftUI
let facilities = ["Wifi","Washer","TV","Bathtub","Bike", "PlayStation"]
struct ReservationCardView: View {
    var body: some View {
        VStack{
            
            VStack (alignment: .leading, spacing: 8){
                Image("hotelCover")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 170)
                    .SmoothCorner(radius: 8)
                    .shadow(color: .gray.opacity(0.2), radius: 5, y:5)
                    .padding(.bottom)
                HStack(spacing: 8){
                    Image(systemName: "calendar")
                        .font(.subheadline)
                    Text("Feb 19, 2023")
                        .font(.subheadline)
                        .fontWeight(.medium)
                }
                .foregroundColor(.secondary)
                Text("The Student Hotel, Eindhoven.")
                    .font(.title2)
                    .bold()
                    .multilineTextAlignment(.leading)
                Text("We are more than a hotel. The Student Hotel brings together student accommodation, hotel rooms, coworking, meetings and events....")
                    .font(.subheadline)
            }.padding(.horizontal, 20)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(facilities, id: \.self) { item in
                        Chips(label: item)
                    }
                }.padding(.leading, 20)
            }.padding(.vertical, 6)
        }
    }
}

struct ReservationCardView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationCardView()
    }
}
