//
//  CategoryCollectionViewCell.swift
//  ApplicationOne
//
//  Created by Anelya Kabyltayeva on 28.01.2023.
//

import UIKit

final class CategoryCollectionViewCell: UICollectionViewCell {
    
    private var cellSelected: Bool = false
    
    private lazy var categoryNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .label
        label.textAlignment = .center
        return label
        
        
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with text: String) {
        categoryNameLabel.text = text
    }
}
//MARK: - Setup views and constraints

private extension CategoryCollectionViewCell {
    
    func setupViews() {
        contentView.addSubview(categoryNameLabel)
        
    }
    
    func setupConstraints() {
        categoryNameLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
}
