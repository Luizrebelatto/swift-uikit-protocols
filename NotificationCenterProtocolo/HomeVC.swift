//
//  ViewController.swift
//  NotificationCenterProtocolo
//
//  Created by Luiz Gabriel Rebelatto Bianchi on 01/05/24.
//

import UIKit

class HomeVC: UIViewController {
    
    var homeScreen: HomeScreen?
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreen?.delegate(delegate: self)
    }
    
}

extension HomeVC: HomeScreenProtocol {
    func tappedChooseButton() {
        let vc: SelectionVC = SelectionVC()
        vc.modalPresentationStyle = .fullScreen
        vc.delegate(delegate: self)
        present(vc, animated: true)
    }
}

extension HomeVC: SelectionVCProtocol {
    func updateImac() {
        homeScreen?.logoImageView.image = UIImage(named: "imac")
        homeScreen?.descriptionLabel.text = "IMAC"
        homeScreen?.descriptionLabel.textColor = .white
    }
    
    func updateMacbook() {
        homeScreen?.logoImageView.image = UIImage(named: "macbook")
        homeScreen?.descriptionLabel.text = "MACBOOK"
        homeScreen?.descriptionLabel.textColor = .white
    }
}
