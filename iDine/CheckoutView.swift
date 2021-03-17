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
    @State private var loyaltyNumber: String = ""
    @State private var addLoyaltyDetails: Bool = false
    @State private var tipAmount: Int = 15
    @State private var showingPaymentAlert: Bool = false
    
    let paymentTypes:[String] = ["Cash","Credit Card","Points"]
    let tipAmounts: [Int] = [5, 10, 20, 25, 0]
    var totalPrice: String
    {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        
        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
    }
    
    var body: some View
    {
        Form
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
                
                Toggle("Add loyalty details", isOn: $addLoyaltyDetails.animation())
                if addLoyaltyDetails
                {
                    TextField("Add your loyalty number", text: $loyaltyNumber)
                }
            }
            Section(header: Text("Add a tip?"))
            {
                Picker("Percentage:", selection: $tipAmount)
                {
                    ForEach(tipAmounts, id: \.self)
                    {
                        Text("\($0)%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("TOTAL: \(totalPrice)"))
            {
                Button("Confirm order")
                {
                    showingPaymentAlert.toggle()
                }
            }
            
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showingPaymentAlert)
        {
            Alert(title: Text("Order confirmed"), message: Text("Your total was \(totalPrice)"), dismissButton: .default(Text("OK")))
        }
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
