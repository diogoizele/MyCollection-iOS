//
//  TopBarView.swift
//  MyCollection
//
//  Created by Diogo Izele on 13/09/25.
//

import UIKit

final class TopBarView: UIView {
    
    static let height: CGFloat = 44
    
    let iconImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "layer-group-solid-full")
        return view
    }()
    
    let titleView: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "MyCollection"
        view.font = .systemFont(ofSize: 18, weight: .semibold)
        view.textColor = .black
        view.numberOfLines = 0
        view.textAlignment = .center
        return view
    }()
    
    let bottomBorder: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(iconImageView)
        addSubview(titleView)
        addSubview(bottomBorder)
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 48),
            
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant:  16),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            titleView.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleView.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            
            bottomBorder.topAnchor.constraint(equalTo: bottomAnchor),
            bottomBorder.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomBorder.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomBorder.heightAnchor.constraint(equalToConstant: 1),
            
        ])
    }
}
