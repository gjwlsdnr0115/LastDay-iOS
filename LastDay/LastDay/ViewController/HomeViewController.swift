//
//  HomeViewController.swift
//  LastDay
//
//  Created by Jinwook Huh on 2021/08/11.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
  
  // MARK: - Views
  
  lazy var greetingMessageLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "안녕하세요, 악어님"
    label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16.0)
    label.textColor = UIColor.black
    return label
  }()
  
  lazy var lastColorMessageLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "마지막 "
    label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 22.0)
    label.textColor = UIColor(displayP3Red: 175/255.0, green: 170/255.0, blue: 226/255.0, alpha: 1)
    return label
  }()
  
  lazy var largeGreetingMessageLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "여행지를"
    label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 22.0)
    label.textColor = UIColor.black
    return label
  }()
  
  lazy var secondGreetingMessageLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "함께 찾아보세요!"
    label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 22.0)
    label.textColor = UIColor.black
    return label
  }()
  
  lazy var searchButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("  어디로 여행가세요?", for: .normal)
    button.setTitleColor(UIColor.gray, for: .normal)
    button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14.0)
    button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
    button.backgroundColor = UIColor.white
    button.tintColor = UIColor(displayP3Red: 175/255.0, green: 170/255.0, blue: 226/255.0, alpha: 1)
    button.addTarget(self, action: #selector(goSearch), for: .touchUpInside)
    return button
  }()
  
  
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    addViews()
    setConstraints()
    setAppearances()
  }
  
  // MARK: - Target Functions
  
  @objc func goSearch() {
    let sb = UIStoryboard.init(name: "Search", bundle: nil)
    let vc = sb.instantiateViewController(identifier: "SearchViewController") as! SearchViewController
    
    vc.modalTransitionStyle = .crossDissolve
    vc.modalPresentationStyle = .fullScreen
    present(vc, animated: true, completion: nil)
  }
  
  
  
  
  
  // MARK: - Appearance, Constraints
  
  func addViews() {
    view.addSubview(greetingMessageLabel)
    view.addSubview(lastColorMessageLabel)
    view.addSubview(largeGreetingMessageLabel)
    view.addSubview(secondGreetingMessageLabel)
    
    view.addSubview(searchButton)

  }
  
  func setAppearances() {
    
    // MARK: - Search Button
    searchButton.layer.cornerRadius = 20
    
    searchButton.layer.borderWidth = 1
    searchButton.layer.borderColor = UIColor(displayP3Red: 175/255.0, green: 170/255.0, blue: 226/255.0, alpha: 1).cgColor
    
    searchButton.layer.shadowOffset = CGSize(width: 3, height: 3)
    searchButton.layer.shadowOpacity = 0.3
    searchButton.layer.shadowRadius = 2
    searchButton.layer.shadowColor = UIColor(displayP3Red: 175/255.0, green: 170/255.0, blue: 226/255.0, alpha: 1).cgColor
  }
  
  func setConstraints() {
    
    // MARK: - Greeting Messages
    greetingMessageLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(80)
      make.leading.equalToSuperview().offset(20)
    }
    
    lastColorMessageLabel.snp.makeConstraints { make in
      make.top.equalTo(greetingMessageLabel.snp.bottom).offset(20)
      make.leading.equalTo(greetingMessageLabel)
    }
    
    largeGreetingMessageLabel.snp.makeConstraints { make in
      make.centerY.equalTo(lastColorMessageLabel)
      make.leading.equalTo(lastColorMessageLabel.snp.trailing)
    }
    
    secondGreetingMessageLabel.snp.makeConstraints { make in
      make.top.equalTo(lastColorMessageLabel.snp.bottom).offset(2)
      make.leading.equalTo(lastColorMessageLabel)
    }
    
    
    
    searchButton.snp.makeConstraints { make in
      make.top.equalTo(secondGreetingMessageLabel.snp.bottom).offset(40)
      make.leading.trailing.equalToSuperview().inset(30)
      make.height.equalTo(40)
    }
  }
  
}
