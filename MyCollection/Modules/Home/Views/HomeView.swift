//
//  HomeView.swift
//  MyCollection
//
//  Created by Diogo Izele on 13/09/25.
//

import UIKit

final class HomeView: UIView {
    
    let headerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 248/255.0, green: 248/255.0, blue: 248/255.0, alpha: 1.0)
        return view
    }()
    
    let headerStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .equalSpacing
        view.spacing = 8
        view.alignment = .center
        view.axis = .vertical
        return view
    }()
    
    let headerTitleView: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Bem-vindo de volta!"
        view.font = .systemFont(ofSize: 20, weight: .semibold)
        view.textColor = .black
        view.textAlignment = .center
        view.numberOfLines = 1
        return view
    }()
    
    let headerSubtitleView: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Gerencie suas coleções de livros, filmes e jogos"
        view.font = .systemFont(ofSize: 14, weight: .medium)
        view.textColor = .darkGray
        view.textAlignment = .center
        return view
    }()
    
    let categoryCounterCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 8
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        view.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        view.register(CategoryCounterCell.self, forCellWithReuseIdentifier: CategoryCounterCell.reuseIdentifier)
        return view
    }()
    
    let tabCategoriesContainerView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 8
        view.axis = .horizontal
        view.alignment = .center
        view.distribution = .fillProportionally
        return view
    }()
    
    let allItemsTabButton: TabButton = {
        let view = TabButton()
        view.title = "Todos"
        view.isSelected = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let booksTabButton: TabButton = {
        let view = TabButton()
        view.title = "Livros"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let moviesTabButton: TabButton = {
        let view = TabButton()
        view.title = "Filmes"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let gamesTabButton: TabButton = {
        let view = TabButton()
        view.title = "Jogos"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.separatorStyle = .none
        view.sectionHeaderTopPadding = 0
        view.register(CollectionItemCell.self, forCellReuseIdentifier: CollectionItemCell.reuseIdentifier)
        return view
    }()
    
    let tableViewHeaderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let tableViewHeaderTitleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 17, weight: .semibold)
        view.textColor = .label
        view.textAlignment = .left
        view.text = "Sua Coleção"
        return view
    }()
    
    let floatingActionButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 16, weight: .bold)
        let image = UIImage(systemName: "plus", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.backgroundColor = .primary
        button.layer.cornerRadius = 28  // metade do tamanho para ficar circular
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = CGSize(width: 0, height: 3)
        button.layer.shadowRadius = 3
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setup()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    private func setup() {
        
        addSubview(headerView)
        addSubview(categoryCounterCollectionView)
        addSubview(tabCategoriesContainerView)
        addSubview(tableViewHeaderView)
        addSubview(tableView)
        addSubview(floatingActionButton)
      
        headerView.addSubview(headerStackView)
        headerStackView.addArrangedSubview(headerTitleView)
        headerStackView.addArrangedSubview(headerSubtitleView)
        
        headerTitleView.setContentHuggingPriority(.required, for: .vertical)
        headerTitleView.setContentCompressionResistancePriority(.required, for: .vertical)
        
        headerSubtitleView.setContentHuggingPriority(.required, for: .vertical)
        headerSubtitleView.setContentCompressionResistancePriority(.required, for: .vertical)
        
        tabCategoriesContainerView.addArrangedSubview(allItemsTabButton)
        tabCategoriesContainerView.addArrangedSubview(booksTabButton)
        tabCategoriesContainerView.addArrangedSubview(moviesTabButton)
        tabCategoriesContainerView.addArrangedSubview(gamesTabButton)
        
        tableViewHeaderView.addSubview(tableViewHeaderTitleLabel)
        
        NSLayoutConstraint.activate([
            
            headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: TopBarView.height),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 96),
            
            headerStackView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            headerStackView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            
            categoryCounterCollectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 16),
            categoryCounterCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            categoryCounterCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            categoryCounterCollectionView.heightAnchor.constraint(equalToConstant: CategoryCounterCell.size.height),
            
            tabCategoriesContainerView.topAnchor.constraint(equalTo: categoryCounterCollectionView.bottomAnchor, constant: 24),
            tabCategoriesContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tabCategoriesContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            tabCategoriesContainerView.heightAnchor.constraint(equalToConstant: 44),
            
            tableViewHeaderView.topAnchor.constraint(equalTo: tabCategoriesContainerView.bottomAnchor),
            tableViewHeaderView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableViewHeaderView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableViewHeaderView.heightAnchor.constraint(equalToConstant: 56),
            
            tableViewHeaderTitleLabel.topAnchor.constraint(equalTo: tableViewHeaderView.topAnchor, constant: 24),
            tableViewHeaderTitleLabel.leadingAnchor.constraint(equalTo: tableViewHeaderView.leadingAnchor, constant: 24),
            
            tableView.topAnchor.constraint(equalTo: tableViewHeaderView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            floatingActionButton.widthAnchor.constraint(equalToConstant: 56),
            floatingActionButton.heightAnchor.constraint(equalToConstant: 56),
            floatingActionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            floatingActionButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24)
        ])
    }
}
