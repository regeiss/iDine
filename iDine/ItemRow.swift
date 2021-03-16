//
//  ItemRow.swift
//  iDine
//
//  Created by Roberto Edgar Geiss on 15/03/21.
//

import SwiftUI

struct ItemRow: View
{
    let item: MenuItem
    var body: some View
    {
        HStack
        {
            Image(item.thumbnailImage)
            VStack(alignment: .leading)
            {
                Text(item.name)
                Text("$\(item.price)")
    
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider
{
    static var previews: some View
    {
        ItemRow(item: MenuItem.example)
    }
}
