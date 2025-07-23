//
//  ViewController.swift
//  MyCollection
//
//  Created by Diogo Izele on 17/07/25.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private let topBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let topBarIconImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "LayerGroupSolid")
        return view
    }()
    
    private let topBarTitleView: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "MyCollection"
        view.font = .systemFont(ofSize: 18, weight: .semibold)
        view.textColor = .black
        view.numberOfLines = 0
        view.textAlignment = .center
        return view
    }()
    
    private let topBarBottomBorder: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0)
        return view
    }()
    
    private let headerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 252/255.0, green: 252/255.0, blue: 252/255.0, alpha: 1.0)
        return view
    }()
    
    private let headerStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .equalSpacing
        view.spacing = 8
        view.alignment = .center
        view.axis = .vertical
        return view
    }()
    
    private let headerTitleView: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Bem-vindo de volta!"
        view.font = .systemFont(ofSize: 20, weight: .semibold)
        view.textColor = .black
        view.textAlignment = .center
        view.numberOfLines = 1
        return view
    }()
    
    private let headerSubtitleView: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Gerencie suas coleções de livros, filmes e jogos"
        view.font = .systemFont(ofSize: 14, weight: .medium)
        view.textColor = .darkGray
        view.textAlignment = .center
        return view
    }()
    
    private let tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(CollectionItemCell.self, forCellReuseIdentifier: CollectionItemCell.reuseIdentifier)
        return view
    }()
    
    private let textView: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.borderStyle = .roundedRect
        view.placeholder = "Search..."
        return view
    }()
    
    
    private var items: [CollectionItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        loadItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    private func setup() {
        
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(topBarView)
        topBarView.addSubview(topBarIconImageView)
        topBarView.addSubview(topBarTitleView)
        view.addSubview(topBarBottomBorder)
        
        view.addSubview(headerView)
        headerView.addSubview(headerStackView)
        headerStackView.addArrangedSubview(headerTitleView)
        headerStackView.addArrangedSubview(headerSubtitleView)
        
        headerTitleView.setContentHuggingPriority(.required, for: .vertical)
        headerTitleView.setContentCompressionResistancePriority(.required, for: .vertical)

        headerSubtitleView.setContentHuggingPriority(.required, for: .vertical)
        headerSubtitleView.setContentCompressionResistancePriority(.required, for: .vertical)

        view.addSubview(tableView)
        view.addSubview(textView)
        
        NSLayoutConstraint.activate([
            topBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topBarView.heightAnchor.constraint(equalToConstant: 48),
            
            topBarIconImageView.leadingAnchor.constraint(equalTo: topBarView.leadingAnchor, constant:  16),
            topBarIconImageView.widthAnchor.constraint(equalToConstant: 24),
            topBarIconImageView.heightAnchor.constraint(equalToConstant: 24),
            topBarIconImageView.centerYAnchor.constraint(equalTo: topBarView.centerYAnchor),
            
            topBarTitleView.centerYAnchor.constraint(equalTo: topBarView.centerYAnchor),
            topBarTitleView.leadingAnchor.constraint(equalTo: topBarIconImageView.trailingAnchor, constant: 8),
         
            topBarBottomBorder.topAnchor.constraint(equalTo: topBarView.bottomAnchor),
            topBarBottomBorder.leadingAnchor.constraint(equalTo: topBarView.leadingAnchor),
            topBarBottomBorder.trailingAnchor.constraint(equalTo: topBarView.trailingAnchor),
            topBarBottomBorder.heightAnchor.constraint(equalToConstant: 1),
            
            headerView.topAnchor.constraint(equalTo: topBarBottomBorder.bottomAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 96),
            
            headerStackView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            headerStackView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
                        
            textView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 24),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            tableView.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 8),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func loadItems() {
        self.items = CollectionItemsMock.items
    }
    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
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

