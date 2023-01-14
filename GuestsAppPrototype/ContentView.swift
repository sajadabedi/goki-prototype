//
//  ContentView.swift
//  GuestsAppPrototype
//
//  Created by Sajad Abedi on 06.01.2023.
//

import SwiftUI


struct ContentView: View {
    
    
    
    @State var firstOpen: Bool = false
    @State var showprofile: Bool = false
    
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
                                SmartKeysView()
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

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
