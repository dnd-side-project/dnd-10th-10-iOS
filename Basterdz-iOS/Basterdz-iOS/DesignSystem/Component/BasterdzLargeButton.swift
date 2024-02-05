//
//  BasterdzLargeButton.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/3/24.
//
import SwiftUI

struct BasterdzLargeButton: View {
    private let image: BasterdzImage
    private let title: String
    private let description: String
    private let action: () -> Void
    
    init(image: BasterdzImage, title: String, description: String, action: @escaping () -> Void) {
        self.image = image
        self.title = title
        self.description = description
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            VStack(spacing: 8) {
                Image(image)
                    .resizable()
                    .scaledToFit()
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
        .buttonStyle(BasterdzLargeButtonStyle())
    }
}

struct BasterdzLargeButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundStyle(
                configuration.isPressed ?
                Color(.white) :
                Color(.red)
            )
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
        BasterdzLargeButton(
            image: .createRoom,
            title: "방 만들기",
            description: "방을 만들어보세요",
            action: {}
        )
        BasterdzLargeButton(
            image: .enterInviteCode,
            title: "방 만들기",
            description: "방을 만들어보세요",
            action: {}
        )
    }.padding(20)
}
