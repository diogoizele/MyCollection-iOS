//
//  CollectionItemCell.swift
//  MyCollection
//
//  Created by Diogo Izele on 17/07/25.
//

import UIKit

class CollectionItemCell: UITableViewCell {
    static let reuseIdentifier = "CollectionItemCell"
    
    private let titleLabel = UILabel()
    private let starsLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        starsLabel.translatesAutoresizingMaskIntoConstraints = false
        starsLabel.textColor = .systemYellow
        
        // contentView é o container principal da célula onde devem ser adicionadas e organizadas todas as subviews personalizadas.
        contentView.addSubview(titleLabel)
        contentView.addSubview(starsLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            starsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            starsLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            starsLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            starsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    func configure(with item: CollectionItem) {
        titleLabel.text = item.title
        
        let ratingAverage = item.ratings.reduce(0) { result, ratingItem in
            result + ratingItem.stars
        } / item.ratings.count
        
        starsLabel.text = String(repeating: "⭐️", count: max(0, min(ratingAverage, 5)))
    }
}
