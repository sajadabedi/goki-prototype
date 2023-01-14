//
//  SmartKeysView.swift
//  GuestsAppPrototype
//
//  Created by Sajad Abedi on 14.01.2023.
//

import SwiftUI
import Shimmer
struct SmartKeysView: View {
    
    let smartKeysArray = [["Room","bed.double.fill"],["Main door", "bed.double.fill"]]
    @State var showDoorCode: Bool = false
    
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                VStack(alignment:.leading){
                    Text("Open door")
                        .font(.title3)
                        .bold()
                        .shimmering(duration: 2.5)
                    
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
                    SmartKeyButtonView(iconName: "bed.double.fill", label: "Room 2341")
                    SmartKeyButtonView(iconName: "door.left.hand.closed", label: "Main Entrance")
                    SmartKeyButtonView(iconName: "bicycle", label: "Bike Shed")
                    SmartKeyButtonView(iconName: "bicycle", label: "Bike Shed")
                }.padding(.leading, 20)
            }.padding(.bottom, 8)
        }
    }
}

struct SmartKeysView_Previews: PreviewProvider {
    static var previews: some View {
        SmartKeysView()
    }
}
