//
//  ContentView.swift
//  GuestsAppPrototype
//
//  Created by Sajad Abedi on 06.01.2023.
//

import SwiftUI
import Shimmer

struct ContentView: View {
    let facilities = ["Wifi","Washer","TV","Bathtub","Bike", "PlayStation"]
    let smartKeysArray = [["Room","bed.double.fill"],["Main door", "bed.double.fill"]]
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .trailing) {
                    NavigationBar
                    VStack(spacing: 18){
                        ReservationCard
                        Divider()
                        SamrtKeys.padding(.bottom)
                        Divider()
                    }
                    Spacer()
                }
                .padding()
            }
        }
    }
}


extension ContentView {
    private var NavigationBar: some View {
        HStack{
            HStack{
                Text("Reservation")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Image(systemName: "chevron.down")
                    .font(.subheadline)
                    .bold()
                    .padding(.top, 4)
                    .foregroundColor(.secondary)
            }
            Spacer()
            HStack(spacing:16.0){
                Image("avatar")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .cornerRadius(.infinity)
            }
        }
    }
    
    // MARK: Reservation Card
    private var ReservationCard: some View{
        VStack{
            Image("hotelCover")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: .infinity, height: 170)
                
                .SmoothCorner(radius: 8)
                .shadow(color: .gray.opacity(0.2), radius: 5, y:5)
                .padding(.bottom)
            VStack (alignment: .leading, spacing: 8){
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
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(facilities, id: \.self) { item in
                            Chips(label: item)
                        }
                    }
                }.padding(.vertical, 6)
            }.frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    // MARK: Smart Keys
    private var SamrtKeys: some View {
        VStack(alignment:.leading){
            Text("Open Door")
                .font(.title3)
                .bold()
                .shimmering()
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    SmartKeyButtonView(iconName: "bed.double.fill", label: "Room")
                    SmartKeyButtonView(iconName: "door.left.hand.closed", label: "Main Entrance")
                    SmartKeyButtonView(iconName: "bicycle", label: "Bike Shed")
                    SmartKeyButtonView(iconName: "bicycle", label: "Bike Shed")
                }
            }.padding(.bottom)
            
            Button {
                
            } label: {
                Image(systemName: "entry.lever.keypad")
                Text("Door Code")
                    .font(.subheadline)
                    .bold()
                    
                    
            }
            .foregroundColor(.primary)
            .padding(12)
            .background(.regularMaterial)
            .SmoothCorner(radius: 8)
            .frame(maxWidth: .infinity)
            
            
            

            
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
