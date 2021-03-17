//
//  CheckoutView.swift
//  iDine
//
//  Created by Roberto Edgar Geiss on 16/03/21.
//

import SwiftUI

struct CheckoutView: View
{
    @EnvironmentObject var order: Order
    @State private var paymentType: String = "Cash"
    let paymentTypes = ["Cash","Credit Card","Points"]
    
    var body: some View
    {
        VStack
        {
            Section
            {
                Picker("How do you want to pay?", selection: $paymentType)
                {
                    ForEach(paymentTypes, id: \.self)
                    {
                        Text($0)
                    }
                }
            }
        }.navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CheckoutView_Previews: PreviewProvider
{
    static var previews: some View
    {
        CheckoutView()
            .environmentObject(Order())
    }
}
