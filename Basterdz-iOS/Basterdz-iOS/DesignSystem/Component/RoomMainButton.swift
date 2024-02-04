//
//  RoomMainButton.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/3/24.
//

import SwiftUI

struct RoomMainButton: View {
    let image: String
    let title: String
    let description: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            VStack(spacing: 8) {
                Image(image, bundle: nil)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(
                        Color(.white)
                    )
                    .frame(width: 80, height: 80)
                
                Text(title)
                    .font(.pretendardB(24))
                    .foregroundStyle(Color(.white))
                
                Text(description)
                    .font(.pretendardR(14))
                    .foregroundStyle(Color(.white))
            }
        })
        .frame(maxWidth: .infinity)
        .frame(height: 210)
        .buttonStyle(RoomMainButtonStyle())
    }
}

struct RoomMainButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundStyle(Color(.white))
            .background(
                configuration.isPressed ?
                Color(.red) :
                Color(.black)
            )
            .cornerRadius(15)
    }
    
}


#Preview {
    HStack {
        RoomMainButton(
            image: "createRoom",
            title: "방 만들기",
            description: "방을 만들어보세요",
            action: {}
        )
        RoomMainButton(
            image: "enterInviteCode",
            title: "방 만들기",
            description: "방을 만들어보세요",
            action: {}
        )
    }.padding(20)
}
