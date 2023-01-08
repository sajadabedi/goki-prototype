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
    @State var firstOpen: Bool = false
    
    var body: some View {
        NavigationStack{
            ZStack(alignment:.bottomTrailing){
                ScrollView (showsIndicators: false){
                    ZStack{
                        VStack(alignment: .trailing) {
                            VStack(spacing: 18){
                                NavigationBar
                                ReservationCard
                                Divider()
                                SamrtKeys
                                Divider()
                                ConciergeList
                            }
                            Spacer()
                        }
                        
                    }
                    .padding()
                }
                FabButton().padding(.horizontal)
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
                .frame(height: 170)
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
            HStack{
                VStack(alignment:.leading){
                    Text("Open door")
                        .font(.title3)
                        .bold()
                        .shimmering(active: firstOpen ? false : true,duration: 2.5)
                        
                    Text("Tap and hold to open")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                Button {
                    
                } label: {
                    HStack{
                        Image(systemName: "entry.lever.keypad")
                        Text("Door code")
                            .font(.subheadline)
                            .bold()
                    }
                }
                .buttonStyle(.borderless)
            }.padding(.bottom, 4)
                
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    SmartKeyButtonView(iconName: "bed.double.fill", label: "Room 2341").onTapGesture {
                        firstOpen = true
                        print(firstOpen)
                    }
                    SmartKeyButtonView(iconName: "door.left.hand.closed", label: "Main Entrance")
                    SmartKeyButtonView(iconName: "bicycle", label: "Bike Shed")
                    SmartKeyButtonView(iconName: "bicycle", label: "Bike Shed")
                }
            }.padding(.bottom, 8)
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var ConciergeList: some View {
        VStack(alignment:.leading){
            Text("Concierge")
                .font(.title3)
                .bold()
                .padding(.bottom)
            VStack(spacing: 12){
                HStack(alignment:.top){
                    Image(systemName: "calendar.badge.plus").frame(width: 32)
                    VStack(alignment: .leading){
                        Text("Extend stay")
                            .bold()
                        Text("Request to stay longer")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(alignment:.top){
                    Image(systemName: "wifi").frame(width: 32)
                    VStack(alignment: .leading){
                        Text("Wi-fi")
                            .bold()
                        Text("Join the guest Wi-Fi")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(alignment:.top){
                    Image(systemName: "person.2.fill").frame(width: 32)
                    VStack(alignment: .leading){
                        Text("Share access")
                            .bold()
                        Text("Share your keys with your family")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(alignment:.top){
                    Image(systemName: "bicycle").frame(width: 32)
                    VStack(alignment: .leading){
                        Text("Rent a Bike")
                            .bold()
                        Text("Under 5min with great price")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
                
            }.frame(maxWidth: .infinity, alignment: .leading)
               
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
