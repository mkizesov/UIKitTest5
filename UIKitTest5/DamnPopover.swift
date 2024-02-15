//
//  DamnPopover.swift
//  UIKitTest5
//
//  Created by M K on 15.02.2024.
//

import UIKit

class DamnPopoverViewController: UIViewController {
    private var heightConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.preferredContentSize = CGSize(width: 300, height: 280)
        
        let segmentControl = UISegmentedControl(items: ["280pt", "150pt"])
        segmentControl.selectedSegmentIndex = 0
        segmentControl.addTarget(self, action: #selector(segmentControlDidChange(_:)), for: .valueChanged)
        
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentControl)
        
        NSLayoutConstraint.activate([
            segmentControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            segmentControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])

        setupCloseButton()
    }
    
    private func setupCloseButton() {
        let closeButton = UIButton(type: .system)
        closeButton.setTitle("×", for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.backgroundColor = .lightGray
        closeButton.setTitleColor(.white, for: .normal)
        closeButton.layer.cornerRadius = 15
        closeButton.clipsToBounds = true
        
        closeButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])
    }

    
    @objc private func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func segmentControlDidChange(_ sender: UISegmentedControl) {
        let height = sender.selectedSegmentIndex == 0 ? 280 : 150
        
        UIView.animate(withDuration: 0.3) {
            self.heightConstraint?.constant = CGFloat(height)
            self.view.layoutIfNeeded()
            
            self.preferredContentSize = CGSize(width: self.preferredContentSize.width, height: CGFloat(height))
        }
    }
}
