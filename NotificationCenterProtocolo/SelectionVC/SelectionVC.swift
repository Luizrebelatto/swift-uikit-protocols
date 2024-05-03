//
//  SelectionVC.swift
//  NotificationCenterProtocolo
//
//  Created by Luiz Gabriel Rebelatto Bianchi on 02/05/24.
//

import UIKit

protocol SelectionVCProtocol: AnyObject {
    func updateImac()
    func updateMacbook()
}

class SelectionVC: UIViewController {
    private weak var delegate: SelectionVCProtocol?
    
    public func delegate(delegate: SelectionVCProtocol){
        self.delegate = delegate
    }
    
    var selectionScreen: SelectionScreen?
    
    override func loadView() {
        selectionScreen = SelectionScreen()
        view = selectionScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        selectionScreen?.delegate(delegate: self)
    }
}

extension SelectionVC: SelectionScreenProtocol {
    func tappedImacButton() {
        delegate?.updateImac()
        dismiss(animated: true)
    }
    
    func tappedMacbookButton(){
        delegate?.updateMacbook()
        dismiss(animated: true)
    }
}
