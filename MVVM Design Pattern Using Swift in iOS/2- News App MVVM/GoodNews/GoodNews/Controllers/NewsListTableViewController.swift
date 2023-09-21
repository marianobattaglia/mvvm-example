//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Mariano Martin Battaglia on 13/02/2023.
//

import Foundation
import UIKit

class NewsListTableViewController : UITableViewController {
    
    // MARK: - Properties
    private var articleListVM: ArticleListViewModel!
    private var country: String = "United States"
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Methods
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = getUrl(country: self.country)
        
        Webservice().getArticles(url: url) { articles in
            if let articles = articles {
                self.articleListVM = ArticleListViewModel(articles: articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(configBtnPressed))
        navigationItem.rightBarButtonItem?.tintColor = .white
    }
    
    private func getUrl(country: String) -> URL {
        let countryPrefix = getPrefixFrom(country)
        let urlString = "https://newsapi.org/v2/top-headlines?country=\(countryPrefix)&category=business&apiKey=6c5298c78873436a81be2d9f6ad6bd63"
        
        return URL(string: urlString)!
    }
    
    private func getPrefixFrom(_ country: String) -> String {
        switch country {
            case "Argentina": return "ar"
            case "Brasil": return "br"
            default: return "us"
        }
    }
    
    @objc func configBtnPressed() {
        let vc = OptionsViewController(delegate: self)
        self.navigationController?.present(vc, animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        let articleList = self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
        return articleList
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }
        
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        
        return cell
    }
    
}

extension NewsListTableViewController: NewsListOptionsProtocol {
    func updateCountry(to country: String) {
        self.country = country
    }
    
    func updateList() {
        setup()
    }
    
}

protocol NewsListOptionsProtocol {
    func updateCountry(to country: String) -> ()
    func updateList() -> ()
}
