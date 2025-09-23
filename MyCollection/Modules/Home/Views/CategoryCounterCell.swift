//
//  CategoryCounterCell.swift
//  MyCollection
//
//  Created by Diogo Izele on 27/07/25.
//

import UIKit

class CategoryCounterCell: UICollectionViewCell {
    static let reuseIdentifier = "CategoryCounterCell"
    static let size = CGSize(width: 112, height: 104)
    
    private lazy var containerView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .center
        return view
    }()
    
    private lazy var iconImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var counterLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 20, weight: .bold)
        view.textColor = .label
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 14, weight: .semibold)
        view.textColor = .darkGray
        view.numberOfLines = 0
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(containerView)
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.systemGray5.cgColor
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        
        containerView.addArrangedSubview(iconImageView)
        containerView.addArrangedSubview(counterLabel)
        containerView.addArrangedSubview(nameLabel)
        
       
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),

            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),
        ])
    }
    
    func configure(with: CategoryCounter) {
        counterLabel.text = String(with.quantity)
        nameLabel.text = with.name
        iconImageView.image = UIImage(named: with.image)
    }
}
