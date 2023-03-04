//
//  HomeViewController.swift
//  SideMenuDrawer
//
//  Created by Praveen Ramalingam on 02/03/23.
//

import UIKit

protocol HomeViewControllerDelegate: AnyObject{
    func didTapMenuButton()
}
class HomeViewController: UIViewController {
    var delegate: HomeViewControllerDelegate?
    var drawerImageView :UIImageView = {
        var drawerImageView = UIImageView()
        drawerImageView.image = UIImage(systemName: "list.dash")
        drawerImageView.isUserInteractionEnabled = true
        return drawerImageView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        drawerImageView.tintColor = UIColor.red
        view.addSubview(drawerImageView)
        configureConstraints()
    }
    
    func configureConstraints(){
        drawerImageView.translatesAutoresizingMaskIntoConstraints = false
        drawerImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30).isActive = true
        drawerImageView.topAnchor.constraint(equalTo: view.topAnchor,constant: 40).isActive = true
        drawerImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        drawerImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        let tap = UITapGestureRecognizer(target: HomeViewController.self, action: #selector(tapFunction(sender:)))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        drawerImageView.addGestureRecognizer(tap)
    }
    @objc func imageButtonTapped(_ sender:UIButton!)
    {
        print("My image button tapped")
    }
    
    @objc private func didTapMenuButton(){
        delegate?.didTapMenuButton()
    }
    
    @objc
    func tapFunction(sender:UITapGestureRecognizer) {
        print("image tap")
    }
    
}

