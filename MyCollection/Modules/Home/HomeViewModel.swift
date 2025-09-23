//
//  HomeViewModel.swift
//  MyCollection
//
//  Created by Diogo Izele on 22/09/25.
//

import Combine

final class HomeViewModel {
    
    private let MAX_PAGE_SIZE: Int = 10
    
    @Published private(set) var items: [CollectionItem] = []
    @Published private(set) var categoriesCounter: [CategoryCounter] = []
    
    @Published var selectedCategory: FilteredCategory = .all
    @Published var page: Int = 1
    @Published var isLoading: Bool = false
}

