//
//  BrawlerTableViewCell.swift
//  Brawl Stars Wiki
//
//  Created by admin on 04/03/24.
//

import UIKit

class BrawlerTableViewCell: UITableViewCell {

    static let identifier: String = String(String(describing: BrawlerTableViewCell.self))
    
    lazy var screen: BrawlerTableViewCellScreen = {
        let view = BrawlerTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addviews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addviews() {
        contentView.addSubview(screen)
        
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            screen.topAnchor.constraint(equalTo: contentView.topAnchor),
            screen.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    public func setupBrawlerCell(data: Brawler) {
        screen.iconBrawl.image = UIImage(named: data.iconBrawl ?? "")
        screen.nameBrawler.text = data.name ?? ""
    }
    
}
