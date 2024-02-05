//
//  TabView.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/3/24.
//

import SwiftUI

struct TabbarView: View {
  var body: some View {
    TabView {
      HomeView()
        .tabItem {
          Image(systemName: "house")
        }
      RoomView()
        .tabItem {
          Image(systemName: "plus")
        }
      BoosterView()
        .tabItem {
          Image(systemName: "flame")
        }
    }
    .font(.headline)
    .accentColor(BasterdzColor.mainBlack.color)
  }
}

#Preview {
    TabbarView()
}
