//
//  ViewController.swift
//  MyCollection
//
//  Created by Diogo Izele on 17/07/25.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private let topBarView: UIView = {
        let topBarView = UIView()
        topBarView.translatesAutoresizingMaskIntoConstraints = false
        topBarView.backgroundColor = .red
        return topBarView
    }()
    
    private let topBarIconImageView: UIImageView = {
        let appIconImageView = UIImageView()
        appIconImageView.translatesAutoresizingMaskIntoConstraints = false
        appIconImageView.contentMode = .scaleAspectFit
        appIconImageView.image = UIImage(named: "LayerGroupSolid")
        return appIconImageView
    }()
    
    private let topBarTitleView: UILabel = {
        let topBarTitleView = UILabel()
        topBarTitleView.translatesAutoresizingMaskIntoConstraints = false
        topBarTitleView.text = "MyCollection"
        topBarTitleView.font = .systemFont(ofSize: 18, weight: .semibold)
        topBarTitleView.textColor = .black
        topBarTitleView.numberOfLines = 0
        topBarTitleView.textAlignment = .center
        return topBarTitleView
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CollectionItemCell.self, forCellReuseIdentifier: CollectionItemCell.reuseIdentifier)
        return tableView
    }()
    
    private let textView: UITextField = {
        let textView = UITextField()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.borderStyle = .roundedRect
        textView.placeholder = "Search..."
        return textView
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
         
            textView.topAnchor.constraint(equalTo: topBarView.bottomAnchor, constant: 24),
            textView.leadingAnchor.constraint(equalTo: topBarView.leadingAnchor, constant: 24),
            textView.trailingAnchor.constraint(equalTo: topBarView.trailingAnchor, constant: -24),
            
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

