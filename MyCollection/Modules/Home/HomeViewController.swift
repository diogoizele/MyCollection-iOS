//
//  ViewController.swift
//  MyCollection
//
//  Created by Diogo Izele on 17/07/25.
//

import Combine
import UIKit

final class HomeViewController: UIViewController {

    private let contentView = HomeView()
    private let viewModel = HomeViewModel(repository: CollectionRepository(service: CollectionService(client: GraphQLClient(url: URL(string:"http://localhost:4000/graphql")!))))
    
    private var cancellables = Set<AnyCancellable>()

    private let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let loadingView = UIActivityIndicatorView(style: .large)

    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
        
        contentView.categoryCounterCollectionView.dataSource = self
        contentView.categoryCounterCollectionView.delegate = self
        
        contentView.allItemsTabButton.delegate = self
        contentView.booksTabButton.delegate = self
        contentView.moviesTabButton.delegate = self
        contentView.gamesTabButton.delegate = self
        
        viewModel.onItemsChanged = { [weak self] in
            self?.contentView.tableView.reloadData()
        }
        
        viewModel.loadItems()
        viewModel.loadStats()
        bind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func bind() {
        viewModel.$stats
               .receive(on: DispatchQueue.main)
               .sink { [weak self] stats in
                   guard let stats else { return }
                   self?.contentView.updateStats(stats: stats)
               }
               .store(in: &cancellables)

           viewModel.$isLoading
               .sink { [weak self] isLoading in
//                   self?.contentView.setLoading(isLoading)
               }
               .store(in: &cancellables)

           viewModel.$errorMessage
               .sink { [weak self] message in
                   guard let message else { return }
//                   self?.contentView.showError(message)
               }
               .store(in: &cancellables)
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionItemCell.reuseIdentifier, for: indexPath) as? CollectionItemCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: viewModel.items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("> didSelectRowAt: \(indexPath)")
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.categoriesCounter.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCounterCell.reuseIdentifier, for: indexPath) as? CategoryCounterCell else {
            return UICollectionViewCell()
        }
        print("index path: \(indexPath.row)")
        cell.configure(with: viewModel.categoriesCounter[indexPath.row])
        
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
            contentView.allItemsTabButton,
            contentView.booksTabButton,
            contentView.moviesTabButton,
            contentView.gamesTabButton]
        for button in tabButtons {
            button.isSelected = false
        }
    }
    
    private func updateCurrentTabFilter (title: String?) {
        switch title {
        case "Livros":
            viewModel.selectedCategory = .category(.Book)
        case "Filmes":
            viewModel.selectedCategory = .category(.Movie)
        case "Jogos":
            viewModel.selectedCategory = .category(.Game)
        default:
            viewModel.selectedCategory = .all
        }
    }
    
    func tabButtonDidTap(_ button: TabButton) {
        clearSelection()
        updateCurrentTabFilter(title: button.title)

        button.isSelected = true
    }
}
