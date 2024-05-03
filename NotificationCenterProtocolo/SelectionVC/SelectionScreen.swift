//
//  SelectionScreen.swift
//  NotificationCenterProtocolo
//
//  Created by Luiz Gabriel Rebelatto Bianchi on 02/05/24.
//

import UIKit

protocol SelectionScreenProtocol: AnyObject {
    func tappedMacbookButton()
    func tappedImacButton()
}

class SelectionScreen: UIView {
    
    private weak var delegate: SelectionScreenProtocol?
    
    public func delegate(delegate: SelectionScreenProtocol) {
        self.delegate = delegate
    }
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .yellow
        label.textAlignment = .center
        label.text = "Opções"
        label.font = UIFont.boldSystemFont(ofSize: 26)
        return label
    }()
    
    lazy var macBookButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "macbook")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(tappedMacbookButton), for: .touchUpInside)
        return button
    }()
    
    lazy var imacBookButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "imac")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(tappedImacButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        addElements()
        configConstraints()
    }
    
    @objc func tappedMacbookButton(_ sender: UIButton){
        delegate?.tappedMacbookButton()
    }
    
    @objc func tappedImacButton(_ sender: UIButton){
        delegate?.tappedImacButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements(){
        addSubview(descriptionLabel)
        addSubview(macBookButton)
        addSubview(imacBookButton)
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            macBookButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 60),
            macBookButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            macBookButton.heightAnchor.constraint(equalToConstant: 150),
            macBookButton.widthAnchor.constraint(equalToConstant: 230),
            
            imacBookButton.topAnchor.constraint(equalTo: macBookButton.bottomAnchor, constant: 40),
            imacBookButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            imacBookButton.heightAnchor.constraint(equalTo: macBookButton.heightAnchor),
            imacBookButton.widthAnchor.constraint(equalTo: macBookButton.widthAnchor)
        ])
    }
    
}
