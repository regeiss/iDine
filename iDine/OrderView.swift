//
//  OrderView.swift
//  iDine
//
//  Created by Roberto Edgar Geiss on 16/03/21.
//

import SwiftUI

struct OrderView: View
{
    @EnvironmentObject var order: Order
    var body: some View
    {
        NavigationView
        {
            List
            {
                Section
                {
                    ForEach(order.items) { item in
                        HStack
                        {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }.onDelete(perform: deleteItems)
                }
                
                Section
                {
                    NavigationLink(
                        destination: CheckoutView(),
                        label: {
                            Text("Place order")
                        })
                }.disabled(order.items.isEmpty)
            }
            .navigationTitle("Order").font(.largeTitle)
            .listStyle(InsetGroupedListStyle())
            .toolbar{EditButton()}
        }
    }
    
    /// <#Description#>
    /// - Parameter offsets: <#offsets description#>
    func deleteItems(at offsets: IndexSet)
    {
        order.items.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider
{
    static var previews: some View
    {
        OrderView()
            .environmentObject(Order())
    }
}
