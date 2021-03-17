//
//  ItemRow.swift
//  iDine
//
//  Created by Roberto Edgar Geiss on 15/03/21.
//

import SwiftUI

struct ItemRow: View
{
    let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    let item: MenuItem
    var body: some View
    {
        HStack
        {
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            VStack(alignment: .leading)
            {
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")
            }
            
            Spacer()
            ForEach(item.restrictions, id: \.self)
            {restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(colors[restriction, default: .black])
                    .foregroundColor(.white)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
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
