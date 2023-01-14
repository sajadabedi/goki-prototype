//
//  ContentView.swift
//  GuestsAppPrototype
//
//  Created by Sajad Abedi on 06.01.2023.
//

import SwiftUI
import Shimmer

struct ContentView: View {
    
    
    let smartKeysArray = [["Room","bed.double.fill"],["Main door", "bed.double.fill"]]
    @State var firstOpen: Bool = false
    @State var showprofile: Bool = false
    @State var showDoorCode: Bool = false
    @State var showBooking: Bool = false
    
    var body: some View {
        NavigationStack{
            ZStack(alignment:.bottomTrailing){
                ScrollView (showsIndicators: false){
                    ZStack{
                        VStack(alignment: .trailing) {
                            VStack(spacing: 18){
                                NavigationBar.padding(.horizontal, 20)
                                ReservationCardView()
                                Divider()
                                SamrtKeys
                                Divider()
                                CunciergeListView()
                            }
                            Spacer()
                        }
                    }
                    
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
           
                Menu {
                    Button {
                        //
                    } label: {
                        Label {
                            Text("Extend Booking")
                        } icon: {
                            Image(systemName: "calendar.badge.plus")
                        }
                    }
                    Button {
                        //
                    } label: {
                        Label {
                            Text("Other Booking")
                            
                        } icon: {
                            Image(systemName: "4.alt.circle")
                        }
                    }
                    Button {
                        //
                    } label: {
                        Label {
                            Text("Find Another Booking")
                        } icon: {
                            Image(systemName: "magnifyingglass.circle")
                        }
                    }
                    
                    
                } label: {
                    
                    HStack(alignment:.center){
                        Text("Booking")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        Image(systemName: "chevron.down")
                            .font(.subheadline)
                            .bold()
                            .frame(height: 10, alignment: .bottom)
                            .rotationEffect(Angle(degrees: showBooking ? 180 : 0))
                            .padding(.top,8)
                            .foregroundColor(.secondary)
                    }
                }.onTapGesture {
                    withAnimation(.spring()) {
                        showBooking.toggle()
                    }
                }


            }
            Spacer()
            HStack(spacing:16.0){
                
                Button {
                    showprofile.toggle()
                } label: {
                    Image("avatar")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .cornerRadius(.infinity)
                }.sheet(isPresented: $showprofile) {
                    Text("User Profile...")
                    
                        .presentationDragIndicator(.hidden)
                        .presentationDetents([.large])
                }

                  
                    
            }
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
                    showDoorCode.toggle()
                } label: {
                    HStack{
                        Image(systemName: "entry.lever.keypad")
                        Text("Door code")
                            .font(.subheadline)
                            .bold()
                    }
                }
                .buttonStyle(.borderless)
                .sheet(isPresented: $showDoorCode) {
                    DoorCodeView()
                        .presentationDetents([.fraction(0.3), .medium, .large])
                }
            }.padding(.bottom, 4).padding(.horizontal, 20)
                
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    SmartKeyButtonView(iconName: "bed.double.fill", label: "Room 2341").onTapGesture {
                        firstOpen = true
                        print(firstOpen)
                    }
                    SmartKeyButtonView(iconName: "door.left.hand.closed", label: "Main Entrance")
                    SmartKeyButtonView(iconName: "bicycle", label: "Bike Shed")
                    SmartKeyButtonView(iconName: "bicycle", label: "Bike Shed")
                }.padding(.leading, 20)
            }.padding(.bottom, 8)
        }.frame(maxWidth: .infinity, alignment: .leading)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
