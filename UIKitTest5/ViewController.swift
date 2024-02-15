//
//  ViewController.swift
//  UIKitTest5
//
//  Created by M K on 15.02.2024.
//

import UIKit


class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    var topCenterButton = UIButton(type: .system)
    private var heightConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .systemBackground
        topCenterButton.setTitle("Present", for: .normal)
        topCenterButton.addTarget(self, action: #selector(topCenterButtonTapped(_:)), for: .touchUpInside)
        self.view.addSubview(topCenterButton)
        topCenterButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topCenterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topCenterButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        ])
    }
    
    @objc func topCenterButtonTapped(_ sender: UIButton) {
        let contentViewController = DamnPopoverViewController()

        contentViewController.modalPresentationStyle = .popover

        if let popoverPresentationController = contentViewController.popoverPresentationController {
            popoverPresentationController.delegate = self
            popoverPresentationController.sourceView = topCenterButton
            popoverPresentationController.sourceRect = CGRect(x: 0, y: 0, width: topCenterButton.bounds.width, height: topCenterButton.bounds.height)
            popoverPresentationController.permittedArrowDirections = [.up]
        }

        self.present(contentViewController, animated: true, completion: nil)
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}

