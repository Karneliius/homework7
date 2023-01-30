//
//  PlacesCollectionViewCell.swift
//  ApplicationOne
//
//  Created by Anelya Kabyltayeva on 30.01.2023.
//

import UIKit
import SnapKit

class PlacesCollectionViewCell: UICollectionViewCell {
    
    private lazy var thePlaceNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .label
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupHeaders(with text: String) {
        thePlaceNameLabel.text = text
    }
}

//MARK: - Setup Views and Constraints methods

private extension PlacesCollectionViewCell {
    
    func setupViews() {
        contentView.addSubview(thePlaceNameLabel)
    }
    
    func setupConstraints() {
        thePlaceNameLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
