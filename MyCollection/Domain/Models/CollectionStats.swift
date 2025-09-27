//
//  CollectionStats.swift
//  MyCollection
//
//  Created by Diogo Izele on 26/09/25.
//

struct CollectionStats: Decodable {
    let totalItems: Int
    let categoryPercentages: [CategoryPercentage]
}
