//
//  TabItemView.swift
//  MyCollection
//
//  Created by Diogo Izele on 28/07/25.
//

import UIKit

protocol TabButtonDelegate: AnyObject {
    func tabButtonDidTap(_ button: TabButton)
}

class TabButton: UIButton {
    
    private let SELECTED_COLOR = UIColor(red: 0x0F/255.0, green: 0x18/255.0, blue: 0x27/255.0, alpha: 1.0)
    
    weak var delegate: TabButtonDelegate?
    
    var title: String = "" {
        didSet {
            setTitle(title, for: .normal)
        }
    }

    override var isSelected: Bool {
        didSet {}
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        self.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        
        self.configurationUpdateHandler = { button in
            var updatedConfig = button.configuration ?? UIButton.Configuration.filled()
            updatedConfig.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16)
            updatedConfig.cornerStyle = .capsule
            updatedConfig.background.strokeWidth = 1

            var titleAttributes = AttributeContainer()
            titleAttributes.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            
            if button.isSelected {
                updatedConfig.baseBackgroundColor = self.SELECTED_COLOR
                updatedConfig.background.strokeColor = self.SELECTED_COLOR
            
                titleAttributes.foregroundColor = UIColor.white
            } else {
                updatedConfig.baseBackgroundColor = .clear
                updatedConfig.background.strokeColor = .systemGray4
                
                titleAttributes.foregroundColor = UIColor.darkGray
            }
            
            updatedConfig.attributedTitle = AttributedString(self.title, attributes: titleAttributes)
            button.configuration = updatedConfig
        }
    }
    
    @objc private func didTap() {
        delegate?.tabButtonDidTap(self)
    }
}
