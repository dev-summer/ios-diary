//
//  DiaryListTableViewCell.swift
//  Diary
//
//  Created by SummerCat and som on 2022/12/20.
//

import UIKit

final class DiaryListTableViewCell: UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    private let diaryInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = LayoutConstant.stackViewSpacing
        return stackView
    }()
    
    private let diaryDetailStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = LayoutConstant.stackViewSpacing
        return stackView
    }()
    
    private let diaryTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        return label
    }()
    
    private let createdDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.setContentHuggingPriority(.required, for: .horizontal)
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        return label
    }()
    
    private let previewLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        return label
    }()
    
    private let weatherIconImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    private func configureUI() {
        configureContentView()
        configureDiaryInfoStackView()
        configureDetailStackView()
    }
    
    private func configureContentView() {
        contentView.addSubview(diaryInfoStackView)
        contentView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: LayoutConstant.contentViewTopMargin,
                                                                       leading: LayoutConstant.contentViewLeadingMargin,
                                                                       bottom: LayoutConstant.contentViewBottomMargin,
                                                                       trailing: LayoutConstant.contentViewTrailingMargin)
    }
    
    private func configureDiaryInfoStackView() {
        diaryInfoStackView.addArrangedSubview(diaryTitleLabel)
        diaryInfoStackView.addArrangedSubview(diaryDetailStackView)
        
        NSLayoutConstraint.activate([
            diaryInfoStackView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            diaryInfoStackView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            diaryInfoStackView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            diaryInfoStackView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor)
        ])
    }
    
    private func configureDetailStackView() {
        diaryDetailStackView.addArrangedSubview(createdDateLabel)
        diaryDetailStackView.addArrangedSubview(weatherIconImageView)
        diaryDetailStackView.addArrangedSubview(previewLabel)
    }
    
    func updateContent(data: DiaryModel) {
        diaryTitleLabel.text = data.title
        createdDateLabel.text = DateFormatterManager().formatDate(data.createdAt)
        previewLabel.text = data.body
        configureItemImage(icon: data.iconName)
    }
    
    private enum LayoutConstant {
        static let stackViewSpacing = CGFloat(4)
        static let contentViewTopMargin = CGFloat(4)
        static let contentViewLeadingMargin = CGFloat(16)
        static let contentViewBottomMargin = CGFloat(4)
        static let contentViewTrailingMargin = CGFloat(8)
    }
    
    func configureItemImage(icon: String) {
        DispatchQueue.global().async {
            let endpoint = WeatherEndpoint.fetchWeatherIconImage(icon: icon)
            
            NetworkManager.publicNetworkManager.getImageData(endpoint: endpoint) { image in
                DispatchQueue.main.async { [weak self] in
                    self?.weatherIconImageView.image = image
                }
            }
        }
    }
}
