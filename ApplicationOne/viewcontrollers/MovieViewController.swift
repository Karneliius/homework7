//
//  MovieViewController.swift
//  ApplicationOne
//
//  Created by Anelya Kabyltayeva on 28.01.2023.
//

import UIKit

final class MovieViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let categoryList = Constants.Category.allCases
    
    private lazy var movieSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search movies, series, tv shows"
        return searchBar
    }()
    
    private lazy var categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.categoryCollectionViewCell)
        collectionView.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var trendingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TrendingCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.trendingCollectionViewCell)
        collectionView.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var categoryTableView: UITableView  = {
        let tableView = UITableView()
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.categoryTableViewCell)
        tableView.isScrollEnabled = false
        tableView.allowsSelection = false
        tableView.layer.borderWidth = 1
        tableView.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        
        trendingCollectionView.dataSource = self
        trendingCollectionView.delegate = self
        categoryTableView.dataSource = self
        categoryTableView.delegate = self
        
        setupViews()
        setupConstraints()
        
    }
}
//MARK: - Collection view data source methods

extension MovieViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoryCollectionView {
            return categoryList.count
        }
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == categoryCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.categoryCollectionViewCell, for: indexPath) as! CategoryCollectionViewCell
            cell.configure(with: categoryList[indexPath.row].rawValue)
            cell.backgroundColor = .systemGray6
            cell.layer.cornerRadius = 5
            cell.clipsToBounds = true
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.trendingCollectionViewCell, for: indexPath) as! TrendingCollectionViewCell
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        return cell
    }
}


//MARK: - Collection view delegate methods

extension MovieViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == categoryCollectionView {
            let label = UILabel()
            label.text = categoryList[indexPath.row].rawValue
            label.font = UIFont.systemFont(ofSize: 15)
            label.sizeToFit()
            return CGSize(width:label.frame.size.width + 30, height:collectionView.frame.size.height - 15)
        }
        let height = collectionView.frame.size.height
        return CGSize(width: view.frame.size.width * 0.75, height: height)
    }
}

// TODO
//extension MovieViewController: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//      let cell = collectionView.cellForItem(at: indexPath)
//        cell?.isSelected = true
//    }
    
//}
//MARK: - Table view  data source methods

extension MovieViewController:UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categoryList.count - 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = SectionHeaderView()
        view.configure(with: categoryList[section + 1].rawValue, number: 6)
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.categoryTableViewCell, for: indexPath) as! CategoryTableViewCell
        return cell
    }
    
}

//MARK: - Table view  delegate methods

extension MovieViewController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height * 0.4
    }
}

//MARK: - Setup views and constraints

private extension MovieViewController {
    
    func setupViews(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(movieSearchBar)
        contentView.addSubview(categoryCollectionView)
        contentView.addSubview(trendingCollectionView)
        contentView.addSubview(categoryTableView)
    }
    
    func setupConstraints(){
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
        }
        contentView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalTo(view).inset(15)
        }
        movieSearchBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.05)
        }
        categoryCollectionView.snp.makeConstraints { make in
            make.top.equalTo(movieSearchBar.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.05)
        }
        trendingCollectionView.snp.makeConstraints { make in
            make.top.equalTo(categoryCollectionView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.15)
        }
        categoryTableView.snp.makeConstraints { make in
            make.top.equalTo(trendingCollectionView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view)
            make.bottom.equalToSuperview()
            
        }
    }
}
