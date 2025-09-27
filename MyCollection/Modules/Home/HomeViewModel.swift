//
//  HomeViewModel.swift
//  MyCollection
//
//  Created by Diogo Izele on 22/09/25.
//

import Foundation
import Combine

final class HomeViewModel {
    
    private let MAX_PAGE_SIZE: Int = 10
    
    @Published private(set) var items: [CollectionItem] = []
    @Published private(set) var categoriesCounter: [CategoryCounter] = []
    @Published private(set) var stats: CollectionStats?
    
    @Published var selectedCategory: FilteredCategory = .all
    @Published var page: Int = 1
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    var onItemsChanged: (() -> Void)?
    
    private let repository: CollectionRepository
    
    init(repository: CollectionRepository) {
        self.repository = repository
    }
    
    func loadItems() {
        items = CollectionItemsMock.items
        onItemsChanged?()
    }
    
    func loadStats(forceRefresh: Bool = false) {
        isLoading = true
        repository.getStats(forceRefresh: forceRefresh) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let stats):
                    self?.stats = stats
                    // Converte CollectionStats -> CategoryCounter
                    self?.categoriesCounter = stats.categoryPercentages.map { percentage in
                        CategoryCounter(
                            name: percentage.category,
                            quantity: percentage.quantity,
                            image: self?.imageName(for: percentage.category) ?? ""
                        )
                    }
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }

    private func imageName(for category: String) -> String {
        switch category.lowercased() {
        case "livros": return "book-solid-full"
        case "filmes": return "film-solid-full"
        case "jogos": return "gamepad-solid-full"
        default: return ""
        }
    }
}

