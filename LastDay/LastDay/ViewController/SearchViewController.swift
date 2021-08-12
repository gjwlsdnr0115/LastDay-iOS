//
//  SearchViewController.swift
//  LastDay
//
//  Created by Jinwook Huh on 2021/08/11.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
  
  // MARK: - Views
  
  lazy var backgroundImgView: UIImageView = {
    let imgView = UIImageView()
    imgView.image = UIImage(named: "search_background")
    imgView.contentMode = .scaleAspectFill
    return imgView
  }()
  
  lazy var reactingBGView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.white
    return view
  }()
  
  lazy var cornerBGView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.white
    return view
  }()
  
  
  lazy var backButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
    button.tintColor = UIColor.black
    button.addTarget(self, action: #selector(goToMain), for: .touchUpInside)
    return button
  }()
  
  lazy var searchTextField: UITextField = {
    let textfield = UITextField()
    textfield.translatesAutoresizingMaskIntoConstraints = false
    textfield.attributedPlaceholder = NSAttributedString(
      string: "어디로 여행가세요?",
      attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray2])
    textfield.tintColor = UIColor.black
    textfield.textColor = .black
//    textfield.font = UIFont(name: "GmarketSansTTFMedium", size: 16.0)
    textfield.isEnabled = true
    textfield.autocapitalizationType = .none
    textfield.autocorrectionType = .no
    textfield.keyboardType = .default
    textfield.returnKeyType = .next
    
    return textfield
  }()
  
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    addViews()
    setConstraints()
    setAppearance()
  }
  
  
  
  // MARK: - Target Functions
  
  @objc func goToMain() {
    dismiss(animated: true, completion: nil)
  }
  
  
  
  // MARK: - Appearance, Constraints
  
  func addViews() {
    view.addSubview(backgroundImgView)
    view.addSubview(cornerBGView)
    view.addSubview(reactingBGView)
    
    // reactingBGView
    reactingBGView.addSubview(backButton)
    reactingBGView.addSubview(searchTextField)
    
    // View order
    view.bringSubviewToFront(reactingBGView)
  }
  
  
  func setAppearance() {
    // MARK: - ReactingBGView
    
    reactingBGView.layer.cornerRadius = 25
    
    
  }
  
  func setConstraints() {
    backgroundImgView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    reactingBGView.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(50)
      make.bottom.leading.trailing.equalToSuperview()
    }
    
    cornerBGView.snp.makeConstraints { make in
      make.height.equalTo(view.bounds.height/2)
      make.bottom.leading.trailing.equalToSuperview()
    }
    
    backButton.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(20)
      make.top.equalToSuperview().offset(25)
      make.height.width.equalTo(25)
    }
    
    searchTextField.snp.makeConstraints { make in
      make.centerY.equalTo(backButton)
      make.leading.equalTo(backButton.snp.trailing).offset(10)
      make.trailing.equalToSuperview().inset(20)
      
    }
    
    
  }
  
}
