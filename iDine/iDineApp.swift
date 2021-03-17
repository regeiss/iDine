//
//  iDineApp.swift
//  iDine
//
//  Created by Roberto Edgar Geiss on 14/03/21.
//

import SwiftUI

@main
struct iDineApp: App
{
    @StateObject var order = Order()
    
    var body: some Scene
    {
        WindowGroup 
        {
            MainView()
                .environmentObject(order)
        }
    }
}
