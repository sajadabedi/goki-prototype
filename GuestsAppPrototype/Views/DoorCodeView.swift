//
//  DoorCodeView.swift
//  GuestsAppPrototype
//
//  Created by Sajad Abedi on 13.01.2023.
//

import SwiftUI

struct DoorCodeView: View {
    var body: some View {
        VStack{
            HStack{
                HStack{
                    Text("Door code")
                        .font(.headline)
                }

            }.frame(maxWidth: .infinity).padding(.top)
                
            Spacer()
            VStack(spacing:16){
                Text("Enter door code on door's keypad.")
                    .lineLimit(2)
                    .foregroundColor(.secondary)
                    .font(.subheadline).padding(.bottom,6).frame(maxWidth: .infinity, alignment: .center)
                HStack{
                    PinCode
                    PinCode
                    PinCode
                    PinCode
                }
                Button {
                    // action
                } label: {
                    Text("Having issue using the codes?")
                }.padding(.top,6)

            }.frame(maxHeight: .infinity)
                
        }.padding()
    }
}


extension DoorCodeView {
    
    private var PinCode: some View {
        VStack(spacing:6){
            Circle()
                .frame(width: 40, height: 40)
                .foregroundColor(Color("ReverseLight"))
                .shadow(color: .black.opacity(0.15), radius: 1,y: 1.4)
                .overlay {
                    Image(systemName: "bed.double.fill")
                        .bold()
                        .foregroundColor(.accentColor)
                }
            Text("Room 201")
                .font(.footnote).foregroundColor(.secondary)
            Text("52001")
                .font(.title3.monospaced()).fontWeight(.semibold)
        }.frame(alignment: .leading).padding(8)
            .background(
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .foregroundColor(Color("Gray4"))
            )
    }
}

struct DoorCodeView_Previews: PreviewProvider {
    static var previews: some View {
        DoorCodeView()
    }
}
