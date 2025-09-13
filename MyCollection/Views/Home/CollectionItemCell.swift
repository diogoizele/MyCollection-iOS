//
//  CollectionItemCell.swift
//  MyCollection
//
//  Created by Diogo Izele on 17/07/25.
//

import UIKit

class CollectionItemCell: UITableViewCell {
    static let reuseIdentifier = "CollectionItemCell"
    
    private let card: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray5.cgColor
        return view
    }()
    
    private let imageItemView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        view.backgroundColor = UIColor.systemGray5
        view.layer.cornerRadius = 4
        view.layer.masksToBounds = true
        return view
    }()
    
    private var imageDataTask: URLSessionDataTask?
    
    private let imagePlaceholder: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 12, weight: .semibold)
        view.numberOfLines = 0
        view.textAlignment = .center
        view.textColor = UIColor.white
        return view
    }()
    
    private let titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 16, weight: .bold)
        return view
    }()
    
    private let authorLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 14, weight: .bold)
        view.textColor = UIColor.gray
        return view
    }()
    
    private let categoryTag = Tag()
    
    private let starsImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "star-solid-full")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let starsLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 12, weight: .bold)
        view.textColor = UIColor.darkGray
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageItemView.image = nil
        imagePlaceholder.isHidden = false
        imageDataTask?.cancel()
        imageDataTask = nil
    }
    
    private func setupUI() {

        selectionStyle = .none
        
        imageItemView.addSubview(imagePlaceholder)
        
        card.addSubview(imageItemView)
        card.addSubview(titleLabel)
        card.addSubview(authorLabel)
        card.addSubview(categoryTag)
        card.addSubview(starsImageView)
        card.addSubview(starsLabel)
        
        // contentView é o container principal da célula onde devem ser adicionadas e organizadas todas as subviews personalizadas.
        contentView.addSubview(card)

        
        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            card.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            card.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            card.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            card.heightAnchor.constraint(equalToConstant: 112),
            
            imagePlaceholder.centerXAnchor.constraint(equalTo: imageItemView.centerXAnchor),
            imagePlaceholder.centerYAnchor.constraint(equalTo: imageItemView.centerYAnchor),
            imagePlaceholder.widthAnchor.constraint(equalToConstant: 70),
//            imagePlaceholder.heightAnchor.constraint(equalToConstant: 80),
            
            imageItemView.topAnchor.constraint(equalTo: card.topAnchor, constant: 16),
            imageItemView.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 16),
            imageItemView.widthAnchor.constraint(equalToConstant: 70),
            imageItemView.heightAnchor.constraint(equalToConstant: 80),
            
            titleLabel.topAnchor.constraint(equalTo: card.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: imageItemView.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -16),
            
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            authorLabel.leadingAnchor.constraint(equalTo: imageItemView.trailingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -16),

            categoryTag.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 4),
            categoryTag.leadingAnchor.constraint(equalTo: imageItemView.trailingAnchor, constant: 16),
            categoryTag.heightAnchor.constraint(equalToConstant: 28),
            
            starsImageView.leadingAnchor.constraint(equalTo: categoryTag.trailingAnchor, constant: 8),
            starsImageView.topAnchor.constraint(equalTo: categoryTag.topAnchor),
            starsImageView.bottomAnchor.constraint(equalTo: categoryTag.bottomAnchor),
            starsImageView.widthAnchor.constraint(equalToConstant: 16),
            
            starsLabel.leadingAnchor.constraint(equalTo: starsImageView.trailingAnchor, constant: 4),
            starsLabel.topAnchor.constraint(equalTo: starsImageView.topAnchor),
            starsLabel.bottomAnchor.constraint(equalTo: starsImageView.bottomAnchor),
        ])
    }
    
    func configure(with item: CollectionItem) {
        titleLabel.text = item.title
        authorLabel.text = item.author
        starsLabel.text = String(item.rating)
        categoryTag.setLabel(item.category.localizedName)
        
        setImagePlaceholder(category: item.category)
        loadImage(urlString: item.imageUrl)
    }
    
    private func setImagePlaceholder(category: CategoryEnum) {
        switch category {
        case .Book:
            imagePlaceholder.text = "Capa do Livro"
        case .Game:
            imagePlaceholder.text = "Poster do Jogo"
        case .Movie:
            imagePlaceholder.text = "Poster da Filme"
        case .Record:
            imagePlaceholder.text = "Capa do Disco"
        }
    }
    
    private func loadImage(urlString: String) {
        imageItemView.image = nil

        imageDataTask?.cancel()
        if let url = URL(string: urlString) {
           imageDataTask = URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
               guard let self = self else { return }
               if let data = data, let image = UIImage(data: data) {
                   DispatchQueue.main.async {
                       self.imageItemView.image = image
                       self.imagePlaceholder.isHidden = true
                   }
               }
           }
           imageDataTask?.resume()
        }
    }
}
