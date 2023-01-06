//
//  DiaryListViewController.swift
//  Diary
//
//  Created by SummerCat and som on 2022/12/20.
//

import UIKit
import CoreLocation

final class DiaryListViewController: UIViewController {
    private var diaryItemManager = DiaryItemManager()
    private let alertManager = AlertManager()
    private let locationmanager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.requestWhenInUseAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyReduced
        return manager
    }()
    
    private let diaryListTableView = UITableView()
    private var diaryItems: [DiaryModel] = [] {
        didSet {
            diaryListTableView.reloadData()
        }
    }
    
    override func loadView() {
        view = diaryListTableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationmanager.delegate = self
        locationmanager.requestLocation()
        configureNavigationBar()
        configureDiaryListTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchCoreData()
    }
    
    private func fetchCoreData() {
        do {
            diaryItems = try diaryItemManager.fetchAllDiaries()
        } catch {
            showErrorAlert(title: Content.loadFailure)
        }
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.scrollEdgeAppearance =
        navigationController?.navigationBar.standardAppearance
        title = Content.diary
        
        let rightBarButtonImage = UIImage(systemName: Content.plusImage)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: rightBarButtonImage,
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(tappedPlusButton))
    }
    
    @objc private func tappedPlusButton(_ sender: UIBarButtonItem) {
        let diaryItemViewController = DiaryItemViewController(diaryItemManager: DiaryItemManager())
        navigationController?.pushViewController(diaryItemViewController, animated: true)
    }
    
    private func configureDiaryListTableView() {
        diaryListTableView.dataSource = self
        diaryListTableView.delegate = self
    }
    
    private enum Content {
        static let plusImage = "plus"
        static let diary = "일기장"
        static let loadFailure = "데이터 로딩 실패"
        static let deleteFailure = "삭제 실패"
    }
}

extension DiaryListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diaryItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        diaryListTableView.register(DiaryListTableViewCell.self,
                                    forCellReuseIdentifier: DiaryListTableViewCell.identifier)
        
        guard let cell = diaryListTableView.dequeueReusableCell(
            withIdentifier: DiaryListTableViewCell.identifier,
            for: indexPath
        ) as? DiaryListTableViewCell else { return UITableViewCell() }
        
        cell.updateContent(data: diaryItems[indexPath.row])
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
}

extension DiaryListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let diaryItemViewController = DiaryItemViewController(diaryItemManager: DiaryItemManager(), id: diaryItems[indexPath.row].id)
        diaryItemViewController.fillTextView(with: diaryItems[indexPath.row])
        diaryItemViewController.alertDelegate = self
        navigationController?.pushViewController(diaryItemViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        var actions: [UIContextualAction] = []
        diaryItemManager.fetchID(id: diaryItems[indexPath.row].id)
        
        let shareAction = UIContextualAction(style: .normal, title: Namespace.share) { _, _, _  in
            let diaryForm = self.diaryItemManager.createDiaryShareForm()
            let activityVC = UIActivityViewController(activityItems: [diaryForm], applicationActivities: nil)
            self.present(activityVC, animated: true)
        }
        shareAction.backgroundColor = .blue
        
        let deleteAction = UIContextualAction(style: .destructive, title: Namespace.delete) { _, _, _  in
            let handler: (UIAlertAction) -> Void = { _ in
                do {
                    try self.diaryItemManager.deleteDiary()
                    self.diaryItems = try self.diaryItemManager.fetchAllDiaries()
                } catch {
                    self.showErrorAlert(title: Content.deleteFailure)
                }
            }
            self.present(self.alertManager.showDeleteAlert(handler: handler), animated: true)
        }
        
        actions.append(deleteAction)
        actions.append(shareAction)
        
        return UISwipeActionsConfiguration(actions: actions)
    }
}

extension DiaryListViewController: AlertDelegate {
    func showErrorAlert(title: String) {
        self.present(self.alertManager.showErrorAlert(title: title), animated: true)
    }
}

extension DiaryListViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinate = locations.last?.coordinate {
            manager.stopUpdatingLocation()
            let endpoint = WeatherEndpoint.fetchWeatherInformation(latitude: coordinate.latitude, longitude: coordinate.longitude)
            NetworkManager.publicNetworkManager.getJSONData(endpoint: endpoint, type: WeatherInformation.self) { result in
                switch result {
                case .success(let weatherData):
                    print(weatherData)
                    return
                case .failure(_):
                    return
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        showErrorAlert(title: "위치 정보 불러오기 실패")
    }
}
