//
//  ViewController.swift
//  MyCollection
//
//  Created by Diogo Izele on 17/07/25.
//

import UIKit

final class HomeViewController: UIViewController {

    
    private var items: [CollectionItem] = []
    private let categories: [CategoryCounter] = [
        CategoryCounter(name: "Livros", quantity: 12, image: "book-solid-full"),
        CategoryCounter(name: "Filmes", quantity: 24, image: "film-solid-full"),
        CategoryCounter(name: "Jogos", quantity: 8, image: "gamepad-solid-full"),
    ]
    private var currentTabFilter: CategoryEnum? = nil
    
    private var homeView: HomeView { view as! HomeView}
   
    override func loadView() {
        view = HomeView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeView.tableView.dataSource = self
        homeView.tableView.delegate = self
        
        homeView.categoryCounterCollectionView.dataSource = self
        homeView.categoryCounterCollectionView.delegate = self
        
        homeView.allItemsTabButton.delegate = self
        homeView.booksTabButton.delegate = self
        homeView.moviesTabButton.delegate = self
        homeView.gamesTabButton.delegate = self
        
        loadItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func loadItems() {
        items = CollectionItemsMock.items
        homeView.tableView.reloadData()
    }
  
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionItemCell.reuseIdentifier, for: indexPath) as? CollectionItemCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("> didSelectRowAt: \(indexPath)")
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCounterCell.reuseIdentifier, for: indexPath) as? CategoryCounterCell else {
            return UICollectionViewCell()
        }
        print("index path: \(indexPath.row)")
        cell.configure(with: categories[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CategoryCounterCell.size
    }
}


extension HomeViewController: TabButtonDelegate {
    private func clearSelection() {
        let tabButtons: [TabButton] = [
            homeView.allItemsTabButton,
            homeView.booksTabButton,
            homeView.moviesTabButton,
            homeView.gamesTabButton]
        for button in tabButtons {
            button.isSelected = false
        }
    }
    
    private func updateCurrentTabFilter (title: String?) {
        switch title {
        case "Livros":
            self.currentTabFilter = .Book
        case "Filmes":
            self.currentTabFilter = .Movie
        case "Jogos":
            self.currentTabFilter = .Game
        default:
            self.currentTabFilter = nil
        }
    }
    
    func tabButtonDidTap(_ button: TabButton) {
        clearSelection()
        updateCurrentTabFilter(title: button.title)

        button.isSelected = true
    }
}
