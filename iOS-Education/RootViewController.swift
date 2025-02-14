//
//  RootViewController.swift
//  iOS-Education
//
//  Created by Nidal Fakhouri on 4/19/18.
//  Copyright © 2018 Nidal Fakhouri. All rights reserved.
//

import UIKit

enum SwiftExample: Int {
    case views = 0
    case buttonsAndLabels
    case timer
    case scrollView
    case tableViewSimple
    case tableViewCustom
    case collectionView
    case autolayout
    case currentLocation
    case urlSession
    //case viewAnimation
    //case formSheet
    case alamofire
    case weatherApp
}

class RootViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Examples"
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }
}

extension RootViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SwiftExample.weatherApp.rawValue + 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        guard let swiftExample = SwiftExample(rawValue: indexPath.row) else {
            return cell
        }

        if swiftExample == .views {
            cell.textLabel?.text = "Views"
        }
        else if swiftExample == .buttonsAndLabels {
            cell.textLabel?.text = "Buttons And Labels"
        }
        else if swiftExample == .timer {
            cell.textLabel?.text = "Timer"
        }
        else if swiftExample == .scrollView {
            cell.textLabel?.text = "Scroll Views"
        }
        else if swiftExample == .tableViewSimple {
            cell.textLabel?.text = "Table Views"
        }
        else if swiftExample == .tableViewCustom {
            cell.textLabel?.text = "Table Views Custom Cell"
        }
        else if swiftExample == .collectionView {
            cell.textLabel?.text = "Collection Views"
        }
        else if swiftExample == .autolayout {
            cell.textLabel?.text = "Autolayout"
        }
        else if swiftExample == .currentLocation {
            cell.textLabel?.text = "Current Location"
        }
        else if swiftExample == .urlSession {
            cell.textLabel?.text = "Networking With URLSession"
        }
        else if swiftExample == .alamofire {
            cell.textLabel?.text = "Networking With Alamofire"
        }
        else if swiftExample == .weatherApp {
            cell.textLabel?.text = "Weather App"
        }
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var viewController: UIViewController? = nil
        
        guard let swiftExample = SwiftExample(rawValue: indexPath.row) else {
            return
        }
        
        if swiftExample == .views {
            viewController = ViewExampleViewController(nibName: "ViewExampleViewController", bundle: nil)
        }
        else if swiftExample == .buttonsAndLabels {
            viewController = ButtonsAndLabelsExampleViewController(nibName: "ButtonsAndLabelsExampleViewController", bundle: nil)
        }
        else if swiftExample == .timer {
            viewController = TimerViewController(nibName: "TimerViewController", bundle: nil)
        }
        else if swiftExample == .scrollView {
            viewController = ScrollViewExampleViewController(nibName: "ScrollViewExampleViewController", bundle: nil)
        }
        else if swiftExample == .tableViewSimple {
            viewController = SimpleTableViewExampleViewController(nibName: "SimpleTableViewExampleViewController", bundle: nil)
        }
        else if swiftExample == .tableViewCustom {
            viewController = CustomTableViewExampleViewController(nibName: "CustomTableViewExampleViewController", bundle: nil)
        }
        else if swiftExample == .collectionView {
            viewController = CollectionViewExampleViewController(nibName: "CollectionViewExampleViewController", bundle: nil)
        }
        else if swiftExample == .autolayout {
            viewController = AutoLayoutExampleViewController(nibName: "AutoLayoutExampleViewController", bundle: nil)
        }
        else if swiftExample == .currentLocation {
            viewController = CurrentLocationExampleViewController(nibName: "CurrentLocationExampleViewController", bundle: nil)
        }
        else if swiftExample == .urlSession {
            viewController = URLSessionExampleViewController(nibName: "URLSessionExampleViewController", bundle: nil)
        }
        else if swiftExample == .alamofire {
            viewController = AlamofireNetworkingExampleViewController(nibName: "AlamofireNetworkingExampleViewController", bundle: nil)
        }
        else if swiftExample == .weatherApp {
            viewController = WeatherRootViewController(nibName: "WeatherRootViewController", bundle: nil)
        }
        
        if let viewControllerToPush = viewController {
            navigationController?.pushViewController(viewControllerToPush, animated: true)
        }
        
        tableView.deselectRow(at: indexPath, animated:true)
    }
}
