//
//  BluetoothView.swift
//  Settings
//
//  Created by choosla on 8/26/25.
//

import SwiftUI

struct BluetoothView: View {
    var body: some View {
      NavigationStack{
        List{
          Text("Bluetooth")
        }.navigationTitle("Bluetooth")
      }
    }
}

#Preview {
    BluetoothView()
}
