//
//  SplashView.swift
//  Basterdz-iOS
//
//  Created by EUNJU on 2/24/24.
//

import SwiftUI

struct SplashView: View {
    
    var body: some View {
        ZStack {
            Color(.mainBlack)
                .ignoresSafeArea()
            VStack {
                Image(BasterdzImage.basterdzIcon)
                    .frame(width: 100, height: 100)
                    .padding(.bottom, 12)
                
                Image(BasterdzImage.basterdz_white)
                    .frame(width: 135, height: 25)
                    .padding(.bottom, 19)
                
                Text("우리들의 도파민중독 탈출기")
                    .font(.pretendardM(20))
                    .foregroundStyle(.white)
            }
        }
        
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                }
            }
        }
    }
}
