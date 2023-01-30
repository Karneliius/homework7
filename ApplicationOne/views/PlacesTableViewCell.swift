//
//  PlacesTableViewCell.swift
//  ApplicationOne
//
//  Created by Anelya Kabyltayeva on 30.01.2023.
//

import UIKit

class PlacesTableViewCell: UITableViewCell {
    private lazy var imageViewCell: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        imageview.layer.cornerRadius = 17
        imageview.clipsToBounds = true
        return imageview
        }()
        
        private lazy var someView: UIView = {
        let view = UIView()
        return view
        }()
        
        private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .label
        label.numberOfLines = 0
        return label
        }()
        
        private lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.textColor = .systemGray
        return label
        }()
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
        setupViews()
        setupConstraints()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func imageOfPlace(with picture: String) {
            imageViewCell.image = UIImage(named: picture)
        }
        
        func nameOfPlace(with text: String) {
            nameLabel.text = text
        }
        
        func addressOfPlace(with adress: String) {
            addressLabel.text = adress
        }
    }

    //MARK: - Setup Views and Constraints methods
    private extension PlacesTableViewCell {
        
        func setupViews() {
            contentView.addSubview(imageViewCell)
            contentView.addSubview(someView)
            someView.addSubview(nameLabel)
            someView.addSubview(addressLabel)
        }
        
        func setupConstraints() {
            imageViewCell.snp.makeConstraints { make in
                make.leading.top.bottom.equalToSuperview()
                make.width.equalToSuperview().multipliedBy(0.25)
                make.height.equalToSuperview().inset(0.9)
            }
            someView.snp.makeConstraints { make in
                make.top.bottom.equalToSuperview()
                make.leading.equalTo(imageViewCell.snp.trailing).offset(10)
                make.trailing.equalToSuperview().inset(20)
                make.height.equalToSuperview()
            }
            
            nameLabel.snp.makeConstraints { make in
                make.top.trailing.leading.equalToSuperview()
                make.height.equalToSuperview().multipliedBy(0.3)
            }
            addressLabel.snp.makeConstraints { make in
                make.top.equalTo(nameLabel.snp.bottom)
                make.trailing.leading.equalToSuperview()
                make.height.equalToSuperview().multipliedBy(0.3)
            }
        }
    }
