//
//  CollectionItem.swift
//  MyCollection
//
//  Created by Diogo Izele on 17/07/25.
//

struct CollectionItem: Codable {
    let id: String
    let title: String
    let author: String
    let category: CategoryEnum
    let description: String
    let imageUrl: String
    let rating: Double
}
